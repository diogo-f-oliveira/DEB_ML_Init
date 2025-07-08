function [data, auxData, metaData, txtData, weights] = mydata_Trachinus_radiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Trachinidae';
metaData.species    = 'Trachinus_radiatus'; 
metaData.species_en = 'Starry weever'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 23];

%% set data
% zero-variate data

data.ab = 18;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(10.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'HameDufo2019';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 21;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'HameDufo2019';
  comment.Lp = 'based on tp = 3.5 yr and tL data';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.0 mm of Trachinus_draco: pi/6*0.1^3';
data.Wwp = 78.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','HameDufo2019'};
  comment.Wwp = 'based on 0.00933*Lp^2.97, see F1';
data.Wwi = 1.04e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^2.97, see F1; max published weight 166.17 g';
 
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(10.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Trachinus draco';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.013	18.419
2.056	16.465
2.979	23.721
3.022	20.651
3.044	19.256
4.028	30.977
4.030	25.116
4.031	22.605
4.051	27.070
4.071	29.302
4.073	23.442
4.092	28.465
4.995	32.930
4.996	31.535
4.997	29.860
4.998	27.070
5.015	38.233
5.018	27.907
5.041	23.163
5.058	34.884
5.060	28.465
5.981	41.302
6.005	32.372
6.026	34.884
6.027	32.651
6.030	23.721
6.046	36.837
6.048	30.419
6.049	27.349
6.070	29.302
6.995	31.535
6.996	30.140
7.012	40.465
7.017	27.349
7.054	43.256
8.003	35.721
8.020	46.047
8.022	39.628
8.023	37.116
8.027	28.186
8.042	44.372
8.044	37.953
8.046	31.535
8.064	41.023
9.011	40.465
9.033	36.837
9.035	32.930
11.031	39.628
12.016	49.953
15.069	41.860];  
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % convert to yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(17.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HameDufo2019'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.958	24.837
3.042	22.884
3.043	20.930
3.065	17.860
3.948	21.488
3.987	28.744
4.008	26.791
4.009	26.233
4.028	32.930
4.052	24.558
4.053	20.372
4.974	34.605
4.976	28.186
5.016	33.767
5.017	31.256
5.042	19.256
5.962	35.163
5.984	33.488
5.986	28.744
6.004	37.395
6.048	30.977
6.994	32.372
6.995	31.535
7.018	24.558
7.039	25.674
8.990	41.860
9.012	36.000
9.013	33.767
9.014	32.093
9.034	34.884
9.958	39.349
9.999	41.860
10.001	34.326
10.002	33.209
10.989	37.953
11.051	42.140
15.050	36.279];  
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert to yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(17.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HameDufo2019'; 

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
1.960	77.778
1.983	83.334
2.916	111.111
3.036	83.334
3.941	255.556
3.942	216.667
3.943	183.333
3.964	288.889
3.967	150.000
4.011	333.333
4.016	111.111
4.874	222.222
4.922	261.111
4.938	627.778
4.964	511.111
4.965	461.111
4.968	305.556
4.969	283.333
4.970	211.111
4.971	155.556
4.990	438.889
4.991	355.556
5.038	394.445
5.922	472.222
5.923	416.667
5.925	322.222
5.927	216.667
5.938	844.445
5.940	744.444
5.941	711.111
5.942	627.778
5.943	605.556
5.949	294.445
5.952	183.333
5.968	538.889
5.969	494.444
5.970	400.000
5.971	383.333
5.974	250.000
5.976	138.889
6.919	861.111
6.925	527.778
6.971	622.222
7.909	350.000
7.920	1000.000
7.926	700.000
7.930	494.444
7.954	522.222
7.966	1127.778
7.972	800.000
7.976	594.444
7.983	244.444
7.999	650.000
8.024	572.222
8.954	711.111
9.000	816.667
10.013	422.222
10.961	822.222
15.024	966.667];  
data.tW_f(:,1) = (0+data.tW_f(:,1))*365; % convert to yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f    = C2K(17.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HameDufo2019'; 
%
data.tW_m = [ ... % time since birth (yr), weight (g)
2.962	161.111
2.963	150.000
2.964	116.667
2.965	55.556
3.942	194.445
3.987	338.889
3.988	277.778
4.010	411.111
4.016	83.334
4.063	138.889
4.922	255.556
4.943	377.778
4.967	405.556
4.968	338.889
4.969	294.445
4.997	61.111
5.018	205.556
5.924	366.667
5.969	483.334
5.974	277.778
5.994	427.778
6.020	322.222
6.980	161.111
6.993	705.556
6.995	638.889
7.000	350.000
7.026	272.222
7.051	216.667
7.950	733.333
7.954	527.778
7.978	483.334
7.994	905.556
8.959	472.222
8.960	438.889
9.001	750.000
9.057	366.667
9.965	405.556
9.980	850.000
9.982	738.889
10.033	605.556
10.060	461.111
10.937	811.111
10.941	616.667
14.985	505.556];  
data.tW_m(:,1) = (0+data.tW_m(:,1))*365; % convert to yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m    = C2K(17.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'HameDufo2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'incubation time is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: weight in g = 0.00933*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '38FML'; % Cat of Life
metaData.links.id_ITIS = '630409'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Echiichthys_vipera'; % Wikipedia
metaData.links.id_ADW = 'Echiichthys_vipera'; % ADW
metaData.links.id_Taxo = '173472'; % Taxonomicon
metaData.links.id_WoRMS = '150630'; % WoRMS
metaData.links.id_fishbase = 'Echiichthys-vipera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echiichthys_vipera}}';
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
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Peter Munk and J{/o}rgen G. Nielsen}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of North Sea fishes}, ' ...
'publisher = {Biofolia, Frederiksberg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Echiichthys-vipera.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HameDufo2019'; type = 'article'; bib = [ ...  
'doi = {10.21411/CBM.A.CEC1B791}, ' ...
'author = {Oussama Hamed and Jean Louis Dufour and Nadia Chakroun-Marzouk and K\''{E}lig Mahe}, ' ...
'year = {2019}, ' ...
'title  = {Age, growth and mortality of the starry weever \emph{Trachinus radiatus} {C}uvier, 1829 in the {T}unisian waters}, ' ...
'journal = {Cah. Biol. Mar. ()  : }, ' ...
'volume = {60}, ' ...
'pages = {87-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

