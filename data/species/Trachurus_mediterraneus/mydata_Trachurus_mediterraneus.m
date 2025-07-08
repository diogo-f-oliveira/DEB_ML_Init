function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_mediterraneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_mediterraneus'; 
metaData.species_en = 'Mediterranean horse mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 15];


%% set data
% zero-variate data

data.ab = 1.2;        units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(17);units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40 * 365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess'; 
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'for females';
data.Li  = 60;        units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.78e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.71-0.92 mm: pi/6*0.081^3';
data.Wwp = 33.4;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Wiki'};
  comment.Wwi = 'based on 0.00912*Lp^2.96, see F1';
data.Wwi = 1672;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^2.96, see F1';

data.Ri  = 1.4e5/ 365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
  
% time-length data
data.tL = [  % yesr class (yr), total length (cm)
0.129	7.382
0.196	8.176
0.211	10.636
0.396	12.542
0.834	14.767
0.918	15.085
0.936	13.657
0.999	19.451
1.035	17.308
1.051	17.705
1.155	15.325
1.270	19.690
1.270	19.055
1.336	21.516
1.372	18.818
1.472	20.644
1.473	19.295
1.589	22.391
1.776	21.836
1.843	22.472
1.962	21.361
2.045	23.901
2.061	24.457
2.246	26.363
2.265	24.300
2.364	26.602
2.383	24.300
2.486	22.952
2.552	24.301
2.739	23.906
2.821	26.684
2.823	25.097
3.042	26.288
3.059	25.733
3.227	27.639
3.243	28.591
3.311	27.798
3.414	25.894
3.446	28.434
3.766	30.817
3.819	27.960
3.850	30.579
3.902	29.468
4.022	28.199
4.039	27.326
4.241	29.550
4.344	27.963
4.730	31.696
4.782	30.109
4.831	31.934
4.882	31.617
5.254	32.413
5.254	31.857
5.409	28.922
5.660	32.812
5.728	32.416
5.796	32.337
5.846	33.290
5.897	32.893
6.150	33.133
6.184	33.768
6.607	33.770
6.726	32.898
6.776	34.089
6.827	33.296
6.861	33.613
7.183	33.298
7.216	33.933
7.706	35.126
7.758	34.095
7.859	34.492
7.927	34.334
8.247	35.288
8.653	35.608
8.755	35.371
8.806	35.054
9.651	36.805
9.720	35.456
10.227	36.729
10.701	36.256
11.274	39.116
11.715	38.405
12.222	39.122];
data.tL(:,1) = (data.tL(:,1) + 0.6) * 365; % convert yr class to time since birth (d)
units.tL   = {'d', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Karl2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tp = 0 * weights.tp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'ab is ignored because it probably relates to hatch, not birth';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% facts
F1 = 'length-weight: wet weight (g) = 0.00912*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKT'; % Cat of Life
metaData.links.id_ITIS = '168590'; % ITIS
metaData.links.id_EoL = '46578052'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_mediterraneus'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_mediterraneus'; % ADW
metaData.links.id_Taxo = '189253'; % Taxonomicon
metaData.links.id_WoRMS = '126820'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-mediterraneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_mediterraneus}}';
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
bibkey = 'Karl2000'; type = 'Article'; bib = [ ... 
'author = {C. Karlou-Riga}, ' ... 
'year = {2000}, ' ...
'title = {Otolith morphology and age and growth of \emph{Trachurus mediterraneus} ({S}teindachner) in the {E}astern {M}editerranean}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {46}, ' ...
'pages = {69-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Trachurus-mediterraneus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

