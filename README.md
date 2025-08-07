# Lab4_DL

---

# Respuestas a preguntas:

Parte 1:

* ¿Cuál es la implicación del overfitting en modelos como Word2Vec?
  R//En Word2Vec, el overfitting ocurre cuando el modelo memoriza relaciones específicas del conjunto de entrenamiento en lugar de aprender representaciones generales del lenguaje. Esto implica que las palabras tendrán vectores muy precisos para el dominio de entrenamiento, pero perderán capacidad de generalizar en textos nuevos. El resultado son embeddings que funcionan bien con oraciones y vocabulario muy similares al dataset inicial, pero que fallan al capturar relaciones semánticas o sintácticas más amplias. En este caso, un entrenamiento demasiado largo o con un vocabulario muy reducido podría llevar a overfitting, disminuyendo la utilidad de los embeddings fuera del dominio original.

* ¿Qué tan bien encontró palabras cercanas su modelo Word2Vec? ¿Podría mejorar? ¿Cómo podría mejorar?
  R//El modelo logró encontrar palabras semánticamente relacionadas en varios casos, por ejemplo, “good” se asocia con “great”, “life” o “friend”, lo que es coherente. Sin embargo, en otras entradas como “school” aparecen términos menos directamente relacionados (“ill”, “meet”), lo que indica que la calidad de los embeddings es moderada y depende de la frecuencia y contexto de cada palabra en el corpus.
Podría mejorar aumentando el número de épocas de entrenamiento, ajustando el tamaño de la ventana de contexto, incrementando el tamaño de los embeddings (embedding size) y usando un batch size más equilibrado (no tan grande como 2^16 para no perder variabilidad). Además, un corpus más limpio y balanceado en frecuencia de palabras ayudaría a mejorar las asociaciones.

* A grandes rasgos, ¿cuál es la diferencia entre Word2Vec y BERT?
  R//Word2Vec es un modelo shallow de una sola capa que aprende vectores estáticos para cada palabra, lo que significa que una palabra siempre tendrá el mismo embedding sin importar el contexto en el que aparezca. Trabaja de manera predictiva (CBOW o Skip-gram) para capturar similitud semántica.
En cambio, BERT es un modelo profundo basado en transformers que genera representaciones contextuales: el embedding de una palabra cambia según las palabras que la rodean. BERT es bidireccional y se entrena con tareas de enmascarado y predicción de siguiente oración, permitiéndole capturar dependencias complejas y relaciones contextuales que Word2Vec no puede modelar.

Parte 2:



---

## Dependencias y como correr

Se puede usar Google Colab o usar un entorno virtual.

```bash
pip install virtualenv
```

Con venv

```bash
python -m venv venv
source venv/bin/activate
```

Dentro del entorno virtual:

```bash
pip install jupyterlab
```

Instalar librerías:
```bash
pip install -r requirements.txt
```


Levanta el servidor:

```bash
jupyter lab
```




