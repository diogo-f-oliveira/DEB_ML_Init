function [data, auxData, metaData, txtData, weights] = mydata_Gymnosarda_unicolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Gymnosarda_unicolor'; 
metaData.species_en = 'Dogtooth tuna'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 03];

%% set data
% zero-variate data

data.ab = 3;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'WelcSmit2023';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 71.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WelcSmit2023'; 
data.Li  = 248;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 5e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.06, see F1';
data.Wwi = 227.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.06, see F1, gives 227.6 kg; max published weight 131 kg; but';

data.Ri  = 20e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 69 kg'; bibkey.Ri  = 'JoshAbdus2012';   
  temp.Ri = C2K(26.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 315244 per kg for 69 cm';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.455	41.992
1.529	78.679
1.820	66.321
2.766	77.245
3.840	89.579
3.894	101.931
3.949	79.695
4.857	97.679
4.858	110.032
4.859	74.385
4.932	100.854
4.967	93.794
4.968	83.912
5.696	92.370
5.805	103.662
5.842	78.955
5.896	94.837
5.913	108.954
5.914	99.072
6.806	100.468
6.843	95.879
6.861	78.937
6.879	132.584
7.698	88.805
7.898	149.860
8.717	101.140
8.843	129.020
8.844	94.785
8.863	119.843
9.700	122.299
9.845	97.944
9.864	138.532
9.882	134.649
10.919	109.572
12.848	145.891
12.866	158.596
12.903	127.537
13.831	120.109
13.867	95.755
13.940	92.224
13.958	88.695
14.832	134.914
14.904	146.207
18.763	160.257];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5)*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(26.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WelcSmit2023';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.911	69.495
3.894	72.637
4.586	81.448
4.950	75.089
5.914	93.425
5.987	123.071
6.806	74.703
6.988	76.818
8.881	93.019
10.045	151.587
12.994	86.947
15.814	93.250
17.944	90.389
20.837	161.985];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5)*365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(26.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WelcSmit2023';
comment.tL_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01072*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L85L'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Gymnosarda_unicolor'; % Wikipedia
metaData.links.id_ADW = 'Gymnosarda_unicolor'; % ADW
metaData.links.id_Taxo = '175590'; % Taxonomicon
metaData.links.id_WoRMS = '219712'; % WoRMS
metaData.links.id_fishbase = 'Gymnosarda-unicolor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...187059
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnosarda_unicolor}}';
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
bibkey = 'WelcSmit2023'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.aaf.2021.12.004}, ' ...
'author = {David J. Welch and Adam K. Smith and Kyne Krusic-Golub and Sandra Erdmann and Stephen J. Newman}, ' ... 
'year = {2023}, ' ...
'title = {Preliminary age-based life history characteristics of the dogtooth tuna, \emph{Gymnosarda unicolor} ({R}uppell, 1838), in the southwest {P}acific {O}cean}, ' ...
'journal = {Aquaculture and Fisheries}, ' ...
'volume = {8}, ' ...
'pages = {323–331}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoshAbdus2012'; type = 'Article'; bib = [ ... 
'author = {K. K. Joshi and E. M. Abdussamad and K. P. Said Koya and M. Sivadas and Somy Kuriakose and D. Prakasan and Manju Sebastine and M. Beni and K. K. Bineesh}, ' ... 
'year = {2012}, ' ...
'title = {Fishery, biology and dynamics of dogtooth tuna, \emph{Gymnosarda unicolor} (R\"{u}ppell, 1838) exploited from {I}ndian seas}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {59(2)}, ' ...
'pages = {75-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gymnosarda-unicolor.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
