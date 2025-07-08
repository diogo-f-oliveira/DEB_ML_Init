function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_gibbosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_gibbosa'; 
metaData.species_en = 'Goldstripe sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 11]; 


%% set data
% zero-variate data;

data.ab = 2;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'DayaGjos1986';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 12.8;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 29.8; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwi = 261;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.03, see F1';

data.Ri  = 73e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), total length (cm)
54.270	5.631
55.822	5.844
57.894	6.199
58.396	5.797
58.916	5.938
60.209	6.104
60.972	5.820
62.512	5.678
63.560	6.199
65.347	5.749
65.356	6.009
67.667	5.820
68.192	6.104
68.714	6.317
70.522	6.483
72.041	5.726
73.599	6.104
74.378	6.293
75.141	6.009
77.463	6.128
79.014	6.317
80.266	5.276
127.556	10.079
128.343	10.505
129.367	10.339
132.155	9.038
132.472	10.765
134.768	10.150
138.385	10.481
143.793	10.481
147.165	11.215
150.760	10.907
154.329	9.866
155.334	9.132
160.529	10.434
167.222	10.363
167.235	10.741
170.923	13.155
173.196	11.853
174.154	9.748
178.072	11.356
178.083	11.688
178.095	12.043
179.372	11.735
179.380	11.972
181.193	12.279
183.768	12.279
185.036	11.711
187.097	11.735
188.116	11.404
190.148	10.576
191.478	11.806
192.980	10.552
193.017	11.640
193.027	11.948
203.576	11.688
204.362	12.066
208.481	12.043
209.499	11.688
209.528	12.539
212.329	11.593
213.104	11.688
214.398	11.877
218.255	11.711
219.032	11.830
219.056	12.539
220.314	11.664
220.577	11.830
221.602	11.688
221.611	11.948
223.389	11.215
225.730	11.924
226.749	11.593
226.759	11.877
228.535	11.120
229.112	12.918
236.750	10.363
240.410	11.972
248.389	11.853];  
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DayaGjos1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ap = 0 * weights.ap;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79MM5'; % Cat of Life
metaData.links.id_ITIS = '551449'; % ITIS
metaData.links.id_EoL = '46562421'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella_gibbosa'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_gibbosa'; % ADW
metaData.links.id_Taxo = '186543'; % Taxonomicon
metaData.links.id_WoRMS = '212277'; % WoRMS
metaData.links.id_fishbase = 'Sardinella-gibbosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella_gibbosa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DayaGjos1986'; type = 'Article'; bib = [ ... 
'author = {P. Dayaratne and J. Gj{\o}saeter}, ' ... 
'year = {1986}, ' ...
'title = {AGE AND GROWTH OF FOUR \emph{Sardinella} SPECIES FROM {S}RILANKA}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {4}, ' ...
'pages = {1--33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sardinella-gibbosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
