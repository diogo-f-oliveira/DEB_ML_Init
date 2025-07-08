function [data, auxData, metaData, txtData, weights] = mydata_Uta_stansburiana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Uta_stansburiana'; 
metaData.species_en = 'Common side-blotched lizard'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 02];

%% set data
% zero-variate data

data.ab = 70;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Tink1967';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '65-77 d, but mean temperature is unknown';
data.am = 5*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.2;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Tink1967';  
data.Lpm  = 4.6;  units.Lpm = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'Tink1967';  
data.Li  = 6;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'Wiki';

data.Wwb = 0.35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Tink1967';  

data.Ri  = 3*4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Tink1967';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 eggs per clutch, 3 clutches per yr assumed';
 
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
30.694	1.861
33.618	1.860
39.172	3.158
44.141	10.097
51.742	16.890
59.050	18.621
66.650	26.716
73.374	28.737
79.805	31.770
101.437	40.724
109.622	43.611
118.392	44.763
133.301	43.453
149.086	44.600
183.289	47.617
190.889	50.360];
data.tW_f(:,2) = data.tW_f(:,2)/10; % convert to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f   = C2K(30);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Tink1967'; 
%
data.tW_m = [ ... % time since birth (d), weight (10*g)
28.940	1.718
32.741	0.703
36.833	1.858
44.141	8.651
51.742	13.998
56.711	16.743
65.481	21.510
74.543	22.951
79.220	29.022
90.037	34.801
103.191	33.781
112.253	32.618
125.700	39.986
133.593	44.899
145.871	39.829
149.379	44.745
161.657	46.617
171.596	50.806
191.766	46.888
209.890	45.720];
data.tW_m(:,2) = data.tW_m(:,2)/10; % convert to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m   = C2K(30);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Tink1967'; 

% length-weight
data.LW_f = [ ... % weight (10*g), SVL (mm) 
3.039	21.054
3.515	22.186
3.871	23.017
4.385	24.112
5.167	25.092
5.872	26.111
6.847	27.167
7.321	28.186
8.103	29.167
9.077	30.109
10.206	31.127
11.064	32.070
11.923	33.088
15.066	35.084
16.389	36.214
18.325	37.117
19.068	38.097
21.429	39.112
23.366	40.090
24.958	41.220
26.509	42.123];
data.LW_f = data.LW_f/10; data.LW_f = data.LW_f(:,[2 1]); % convert to L, W, L 
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight','females'};  
bibkey.LW_f = 'Tink1967'; comment.LW_f = 'data for females';
%
data.LW_m = [ ... % weight (10*g), SVL (mm)
2.886	21.130
3.360	22.149
3.718	23.093
4.424	24.149
5.013	25.131
5.718	26.149
6.692	27.092
7.513	28.110
8.101	29.016
9.192	30.071
10.437	31.127
11.334	32.107
12.693	33.086
13.552	34.029
14.681	35.085
16.272	36.139
17.324	37.119
19.299	38.059
21.159	39.113
22.519	40.130
24.881	41.183
24.892	42.127
29.293	43.099
30.191	44.080];
data.LW_m = data.LW_m/10; data.LW_m = data.LW_m(:,[2 1]); % convert to L, W
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight','males'};  
bibkey.LW_m = 'Tink1967'; comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7F3TX'; % Cat of Life
metaData.links.id_ITIS = '173956'; % ITIS
metaData.links.id_EoL = '1055085'; % Ency of Life
metaData.links.id_Wiki = 'Uta_stansburiana'; % Wikipedia
metaData.links.id_ADW = 'Uta_stansburiana'; % ADW
metaData.links.id_Taxo = '49029'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Uta&species=stansburiana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uta_stansburiana}}';
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
bibkey = 'Tink1967'; type = 'misc'; bib = [ ... 
'author = {Donald W. Tinkle}, ' ... 
'year = {1967}, ' ...
'title = {The Life and Demography of the Side-Blotched Lizard, \emph{Uta stansburiana}}, ' ...
'journal = {Miscellaneous Publications of Museum of Zoology, Univ of Michigan}, ' ...
'howpublished = {\utl{https://deepblue.lib.umich.edu/bitstream/handle/2027.42/56376/MP132.pdf?sequence=1}}, ' ...
'number = {132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

