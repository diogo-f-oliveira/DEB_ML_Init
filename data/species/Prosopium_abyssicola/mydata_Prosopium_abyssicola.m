function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_abyssicola
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_abyssicola'; 
metaData.species_en = 'Bear Lake whitefish'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 09 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 11];


%% set data
% zero-variate data

data.am = 30*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Thom2003';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Thom2003'; 
  comment.Lp = 'based on tp 3 yr and tL data';
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'Thom2003';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Shes2017';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 32.45; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'fishbase','Thom2003'}; 
  comment.Wwp = 'based on 0.00457*Lp^3.13, see F1';
data.Wwi  = 472; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'fishbase','Thom2003'}; 
  comment.Wwi = 'based on 0.00457*Li^3.13, see F1';

% uni-variate data
% time-length
data.tL = [... %  time since birth (yr), total length (cm)
0.970	12.741
1.966	16.061
2.936	20.960
3.917	22.333
4.942	23.390
5.947	24.131
6.931	24.557
7.916	24.772
8.966	24.934
9.973	25.202
10.958	25.364];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Thom2003';

% length - fecundity
data.LN = [ ... % total length (log10 mm), fecundity (log10 #)
2.293	3.045
2.295	3.102
2.298	3.108
2.301	3.032
2.312	3.109
2.320	3.179
2.320	3.109
2.320	3.071
2.331	3.103
2.340	3.173
2.342	3.091
2.345	3.192
2.350	3.072
2.357	3.008
2.362	3.129
2.365	3.167
2.367	3.231
2.367	3.066
2.369	3.187
2.377	3.136
2.378	3.104
2.387	3.200
2.388	3.270
2.391	3.155
2.391	3.111
2.397	3.213
2.398	3.327
2.402	3.295
2.403	3.162
2.412	3.130
2.431	3.385
2.444	3.265
2.451	3.290
2.456	3.354
2.471	3.482
2.497	3.546
2.584	3.872
2.605	3.930
2.606	3.796
2.609	4.095
2.620	4.115
2.643	4.287];
data.LN = 10.^data.LN; % remove log transform
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Thom2003';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
9.915	6.154
10.364	7.385
10.725	5.538
10.934	10.462
11.504	11.077
11.655	6.769
12.193	12.923
12.372	16.615
12.434	11.692
12.523	13.538
12.703	16.000
12.913	15.385
12.943	16.615
13.183	14.154
13.483	17.846
13.634	13.538
13.811	24.000
13.872	20.923
13.873	16.615
14.111	22.154
14.113	17.231
14.382	22.154
14.411	25.231
14.503	18.462
14.800	27.077
14.980	28.923
15.100	27.692
15.280	27.692
15.312	20.923
15.490	28.923
15.851	25.231
15.911	26.462
15.939	31.385
16.240	31.385
16.809	33.231
16.838	37.538
17.169	33.231
17.499	34.462
17.707	41.846
17.739	36.308
17.886	45.538
17.887	40.615
18.008	38.769
18.247	43.692
18.305	50.462
18.456	44.923
18.756	48.000
18.784	52.923
18.817	42.462
18.968	40.000
18.995	50.462
19.113	56.615
19.296	48.615
19.353	56.615
19.478	40.615
19.505	51.692
19.625	51.692
19.654	54.769
19.745	51.692
19.832	60.308
19.983	58.462
19.984	53.538
19.987	46.154
20.072	62.154
20.101	66.462
20.312	60.923
20.313	59.077
20.405	52.923
20.551	64.615
20.639	70.769
20.732	63.385
20.793	59.692
20.821	65.846
20.849	72.000
20.916	51.077
21.064	56.615
21.090	70.769
21.152	62.154
21.333	58.462
21.361	66.462
21.418	77.538
21.422	63.385
21.632	65.231
21.691	67.692
21.778	76.923
21.779	73.231
21.866	84.923
21.990	69.538
22.047	82.462
22.196	83.692
22.200	72.615
22.258	77.538
22.316	84.923
22.528	77.538
22.556	86.154
22.584	92.923
22.619	73.846
22.620	71.385
22.652	66.462
22.652	66.462
22.677	80.615
22.767	80.615
22.861	67.077
22.918	78.154
22.980	71.385
23.036	86.769
23.097	81.231
23.130	71.385
23.218	80.615
23.244	92.308
23.299	110.769
23.341	69.538
23.481	102.769
23.487	83.077
23.488	78.769
23.574	91.692
23.636	85.538
23.660	106.462
23.691	104.000
23.722	99.692
23.725	89.231
23.756	88.000
23.782	99.077
23.789	76.308
23.872	99.692
23.994	92.923
24.026	86.769
24.051	104.000
24.296	88.000
24.325	91.692
24.380	108.308
24.384	95.385
24.503	96.000
24.531	103.385
24.590	107.692
24.654	93.538
24.656	87.385
24.713	99.077
24.801	103.385
24.829	112.615
24.830	106.462
24.862	100.308
24.865	89.846
24.953	97.231
24.976	120.615
25.130	107.692
25.217	118.769
25.251	106.462
25.396	121.846
25.489	112.615
25.610	108.308
25.787	120.000
25.792	103.385
25.848	116.923
25.880	110.154
25.969	112.000
26.151	107.077
26.294	128.615
26.380	144.615
26.712	136.000
26.806	123.692
26.861	141.538
27.793	135.385
28.890	179.077];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Thom2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00457 *(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4MW8Z'; % Cat of Life
metaData.links.id_ITIS = '162012'; % ITIS
metaData.links.id_EoL = '215641'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_abyssicola'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_abyssicola'; % ADW
metaData.links.id_Taxo = '184828'; % Taxonomicon
metaData.links.id_WoRMS = '1525711'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-abyssicola'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_abyssicola}}';
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
bibkey = 'Thom2003'; type = 'phdthesis'; bib = [ ... 
'author = {Thompson, Brett W.}, ' ... 
'year = {2003}, ' ...
'title = {An Ecological/Life History Comparison of Two Whitefish Species in {B}ear {L}ake, {U}tah/{I}daho}, ' ...
'school = {Utah State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-abyssicola.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

