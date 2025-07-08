function [data, auxData, metaData, txtData, weights] = mydata_Platichthys_stellatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Platichthys_stellatus'; 
metaData.species_en = 'Starry flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ah_T'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 03 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ah12 = 68/24;    units.ah12 = 'd';  label.ah12 = 'age at hatch';              bibkey.ah12 = 'oac';   
  temp.ah12 = C2K(12.5); units.temp.ah12 = 'K'; label.temp.ah12 = 'temperature'; 
data.ah10 = 110/24;    units.ah10 = 'd';  label.ah10 = 'age at hatch';              bibkey.ah10 = 'oac';   
  temp.ah10 = C2K(10.5); units.temp.ah10 = 'K'; label.temp.ah10 = 'temperature'; 
data.tb = 68/24;    units.tb = 'd';  label.tb = 'time since hatch at birth';       bibkey.tb = 'oac';   
  temp.tb = C2K(12.5); units.temp.tb = 'K'; label.temp.tb = 'temperature'; 
data.tp = 3*365;    units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'oac';   
  temp.tp = C2K(4); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 2.5*365;    units.tpm = 'd';  label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'oac';   
  temp.tpm = C2K(4); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 24*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.2;   units.Lh  = 'cm';  label.Lh  = 'length at hatch';   bibkey.Lh  = 'oac';
data.Lb  = 0.35;  units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'oac';
data.Lj  = 1.05;  units.Lj  = 'cm';  label.Lj  = 'length at metam';   bibkey.Lj  = 'oac';
data.Lp  = 29;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'oac';
data.Lpm  = 27.5;  units.Lpm  = 'cm';  label.Lpm  = 'length at puberty for males';  bibkey.Lpm  = 'oac';
data.Li  = 91;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';

data.Wwb = 4.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'oac';
  comment.Wwb = 'based on egg diameter 0.95 mm: 4/3*pi*0.0475^3';
data.Wwi = 13e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.01210*Li^3.081';
  
data.Ri  = 3e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr), standard length (cm)
0.436	4.116
0.551	8.236
0.639	9.037
0.910	10.292
1.104	11.434
1.152	12.693
1.248	15.326
1.326	17.271
1.462	13.032
1.722	22.647
1.810	23.333
1.897	24.935
2.013	24.131
2.110	24.702
2.178	26.076
2.478	29.735
2.672	28.931
2.895	28.813
2.962	30.644
3.040	32.475
3.475	37.164
3.543	35.102
3.824	37.044
4.047	39.331
4.134	40.361
4.405	43.448
4.493	39.554
4.570	40.812
4.746	36.573
4.832	39.778
5.055	45.157
5.491	43.318
5.908	45.488
5.995	47.891
6.043	49.379
6.983	50.740
7.079	56.807
7.488	50.389];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'females'};  
temp.tL_f = C2K(4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'oac';
comment.tL_f = 'Data for females';
% 
data.tL_m = [... % time since birth (yr), standard length (cm)
0.068	0.457
0.136	0.799
0.242	2.630
0.329	2.972
0.407	3.429
0.561	7.320
0.639	8.235
0.736	7.890
0.997	11.092
1.161	14.640
1.228	19.104
1.317	13.721
1.578	15.206
1.665	19.213
1.839	22.531
1.877	24.133
2.003	24.933
2.071	25.161
2.149	25.847
2.575	28.474
2.653	26.527
2.808	25.494
2.885	28.127
3.001	30.186
3.108	29.726
3.554	32.583
3.661	29.260
3.768	28.572
3.796	31.663
3.922	32.577
4.009	35.439
4.057	40.476
4.474	35.547
4.552	36.461
4.997	38.860
5.055	42.179];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'oac';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ... % standard length (cm), weight (g)
10.6   35.4
11.2   42.5
22.4  226.9
23.6  311.5
24.6  340.3
25.8  353.7
26.9  510.4
27.4  491.5
28.4  538.8
29.5  567.1
30.3  635.2
31.3  794.0
32.4  567.2
33.4  907.4
34.2  860.2
35.3 1058.6
36.2 1140.8
37.3 1349.6
38.1 1276.1
39.2 1550.1
40.3 1474.2
41.5 1785.9
42.1 1739.0
43.5 2344.1
44.2 2268.5
45.0 2268.5
46.3 2111.8
47.6 2608.8
48.0 3204.8
49.5 3289.3
50.5 3289.3
51.0 3289.3];
units.LW_f = {'cm', 'g'}; label.LW_f = {'standard length', 'wet weight', 'female'};  
bibkey.LW_f = 'oac';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % standard length (cm), weight (g)
10.1   28.3
12.6   31.9
18.6  170.1
19.2  226.9
21.2  235.0
22.4  226.9
23.4  343.0
24.2  343.0
25.2  418.9
26.4  444.1
27.4  491.5
28.2  567.1
29.1  661.3
30.3  586.5
31.2  652.2
32.4  793.9
33.4  751.5
34.3  964.1
35.2  998.1
36.5 1134.3
37.1 1191.0
38.5 1190.9];
units.LW_m = {'cm', 'g'}; label.LW_m = {'standard length', 'wet weight', 'male'};  
bibkey.LW_m = 'oac';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
set2 = {'LW_f', 'LW_m'};  subtitle2 = {'Data for female, male'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 4 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Both eyes can be dextral or sinistral (left or right side of body)';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Weight (g) - length (cm): 0.01210*L^3.081';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4JNBT'; % Cat of Life
metaData.links.id_ITIS = '172893'; % ITIS
metaData.links.id_EoL = '46570116'; % Ency of Life
metaData.links.id_Wiki = 'Platichthys_stellatus'; % Wikipedia
metaData.links.id_ADW = 'Platichthys_stellatus'; % ADW
metaData.links.id_Taxo = '46959'; % Taxonomicon
metaData.links.id_WoRMS = '154781'; % WoRMS
metaData.links.id_fishbase = 'Platichthys-stellatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platichthys_stellatus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/516}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'oac'; type = 'Misc'; bib = [...
'author = {H. G. ORCUTT}, ' ... 
'year = {1950}, ' ...
'howpublished = {\url{http://www.oac.cdlib.org/view?docId=kt1f59n4tn&brand=oac4&doc.view=entire_text}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

