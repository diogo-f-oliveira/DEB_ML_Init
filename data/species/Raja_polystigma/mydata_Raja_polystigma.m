function [data, auxData, metaData, txtData, weights] = mydata_Raja_polystigma
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_polystigma'; 
metaData.species_en = 'Speckled ray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 28];

%% set data
% zero-variate data;
data.ab = 4.5*30.5;units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'PorcBell2020';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10.6; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PorcBell2020';
data.Lp  = 50.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'PorcBell2020';
data.Lpm = 48.8;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'PorcBell2020';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 1.27e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00166*Li^3.31, see F1';

data.Ri  = 40/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 till 62 eggs per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.038	17.285
0.038	15.323
0.050	16.304
0.980	21.435
0.992	19.964
1.005	25.235
1.005	24.377
1.005	23.519
1.005	23.151
1.005	18.738
1.017	25.970
1.017	21.925
1.972	23.500
1.972	24.972
2.022	27.790
3.002	33.656
3.002	26.914
3.002	27.404
3.002	28.017
3.002	29.120
3.002	29.978
3.014	30.959
3.969	31.309
3.982	34.741
3.994	35.722
4.019	32.411
4.019	36.579
4.019	38.541
4.999	37.419
4.999	37.909
5.012	42.445
5.012	34.354
5.049	35.702
6.004	40.220
6.016	40.464
6.029	40.955
6.042	46.348
8.001	45.576
8.001	45.821
8.001	46.311
8.014	43.614
9.018	56.100
9.043	54.015
10.036	57.797
11.028	59.127];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
  temp.tL_f = C2K(14); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PorcBell2020';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.013	11.401
0.025	16.795
0.038	15.568
0.942	20.945
0.980	22.293
0.980	21.803
0.992	19.719
1.005	23.519
1.017	24.254
1.972	26.075
2.010	28.771
2.010	24.235
2.010	23.132
2.989	31.450
3.002	35.250
3.002	32.430
3.002	29.488
3.002	28.017
3.014	30.959
3.014	30.469
3.957	36.458
3.969	35.232
3.994	39.522
3.994	34.618
4.019	37.437
4.032	33.146
4.032	31.307
4.999	37.787
5.012	42.077
5.012	38.767
5.012	35.825
5.024	39.257
5.024	37.051
6.004	40.955
6.004	37.768
6.016	44.633
6.042	41.445
6.996	42.040
7.009	45.227
7.021	47.311
7.021	47.065
7.021	43.755
8.014	51.215
8.026	49.131
8.039	51.705];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
  temp.tL_m = C2K(14); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PorcBell2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00166*(TL in cm)^3.31';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78RMQ'; % Cat of Life
metaData.links.id_ITIS = '160879'; % ITIS
metaData.links.id_EoL = '46560546'; % Ency of Life
metaData.links.id_Wiki = 'Raja_polystigma'; % Wikipedia
metaData.links.id_ADW = 'Raja_polystigma'; % ADW
metaData.links.id_Taxo = '101382'; % Taxonomicon
metaData.links.id_WoRMS = '105881'; % WoRMS
metaData.links.id_fishbase = 'Raja-polystigma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Raja_polystigma}}'; 
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
bibkey = 'PorcBell2020'; type = 'article'; bib = [ ...  
'author = {Cristina Porcu and Andrea Bellodi and Alessandro Cau and Rita Cannas and Martina F. Marongiu and Antonello Mulas and Maria C. Follesa}, ' ...
'year = {2020}, ' ...
'title  = {Uncommon biological patterns of a little known endemic {M}editerranean skate, \emph{Raja polystigma} ({R}isso, 1810)}, ' ...
'journal = {Regional Studies in Marine Science}, ' ...
'volume = {34}, ' ...
'pages = {101065}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Raja-polystigma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  