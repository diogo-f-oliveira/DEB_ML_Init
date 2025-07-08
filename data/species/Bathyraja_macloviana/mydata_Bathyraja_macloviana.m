function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_macloviana

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_macloviana'; 
metaData.species_en = 'Patagonian skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 07]; 

%% set data
% zero-variate data;
data.ab = 1*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(5.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v = 0.032 cm/d, as is typical for Bathyraja';
data.am = 12*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Buck2006';   
  temp.am = C2K(5.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13.9;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on 0.18*Li, as typical for Bathyraja';
data.Lp = 53.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Buck2006';
  comment.Lp = '52-55 cm';
data.Li  = 77;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Buck2006'; 

data.Wwi = 3.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1'; 

data.Ri  = 16/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.65, as is typical for Bathyraja';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.464	29.013
2.503	37.973
3.924	44.587
3.925	42.667
4.939	50.347
4.963	54.827
4.963	52.267
4.965	48.427
4.965	47.573
4.965	46.720
5.952	58.027
5.953	56.320
5.953	55.467
5.954	53.760
5.954	52.267
5.955	50.133
6.944	55.893
6.945	54.187
6.945	51.627
6.946	50.773
6.946	49.707
6.966	65.920
6.967	64.853
6.967	62.293
6.968	61.227
6.968	60.160
6.969	58.667
6.969	57.387
6.991	66.987
7.931	67.200
7.932	66.560
7.957	65.493
7.958	64.853
7.958	63.573
7.958	62.080
7.959	60.373
7.959	59.093
7.985	58.027
8.922	66.773
8.923	65.493
8.923	64.213
8.924	63.147
8.950	59.520
9.939	65.493
9.991	62.720
11.920	68.693];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(5.4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Buck2006'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.889	32.427
2.934	40.533
2.978	38.187
3.938	41.173
3.938	39.253
4.896	47.573
4.915	55.893
4.916	55.040
4.917	49.920
4.917	48.427
4.919	42.240
4.938	53.333
5.918	58.027
5.919	56.960
5.919	55.893
5.919	55.253
5.920	53.973
5.920	52.480
5.920	51.413
6.921	62.720
6.921	61.440
6.921	60.373
6.922	58.880
6.922	57.600
6.923	55.040
6.923	53.547
6.924	52.907
7.902	63.573
7.903	61.013
7.904	59.520
7.948	57.173
8.905	65.707
8.906	64.427
8.906	62.293
8.907	60.160
9.975	65.067
10.936	62.080];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(5.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Buck2006'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WDZG'; % Cat of Life
metaData.links.id_ITIS = '564253'; % ITIS
metaData.links.id_EoL = '46560767'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_macloviana'; % ADW
metaData.links.id_Taxo = '163718'; % Taxonomicon
metaData.links.id_WoRMS = '271519'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-macloviana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}';  
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
bibkey = 'Buck2006'; type = 'phdthesis'; bib = [ ...
'author = {Amelie B\"{u}cker}, ' ...
'year = {2006}, ' ...
'title  = {Age and growth of skates of the genus \emph{Bathyraja} in Argentina}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-macloviana.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
