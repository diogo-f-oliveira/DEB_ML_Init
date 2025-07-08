function [data, auxData, metaData, txtData, weights] = mydata_Rioraja_agassizii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Rioraja_agassizii'; 
metaData.species_en = 'Rio skate'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 6*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(14.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'CaltSilv2005';   
  temp.am = C2K(14.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 9; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'CaltSilv2005';
  comment.Lb = 'TL 8-12 cm';
data.Lp  = 42; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CaltSilv2005';
  comment.Lp = 'TL 32-52 cm';
data.Li  = 71;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'CaltSilv2005';

data.Wwi = 1.99e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'CaltSilv2005','fishbase'};
 comment.Wwi = 'based on 0.00468*Li^3.04, see F1';

data.Ri  = 92/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(14.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '62-124 eggs per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	12.172
0.000	10.883
0.000	8.878
1.070	18.902
3.031	27.637
3.055	29.069
3.055	30.072
3.057	35.227
3.080	32.363
4.001	36.229
4.002	37.947
4.004	43.103
4.923	42.530
5.016	37.088
5.017	40.525
5.018	43.675
5.019	44.535
6.009	43.675
6.009	44.248
6.009	45.251
6.010	46.110
6.034	47.971
6.955	49.976
6.978	48.544
7.023	44.964
7.024	45.823
7.024	46.826
7.969	50.263
9.078	51.122
10.022	53.556];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(14.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CaltSilv2005';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	10.797
0.000	9.510
0.000	9.796
0.000	11.085
2.129	26.027
3.009	35.929
3.009	37.075
3.021	26.192
3.021	27.910
3.093	32.351
3.972	38.816
3.985	34.950
3.985	36.096
4.000	37.958
4.013	32.087
5.020	42.564
5.033	37.409
5.033	39.414
5.048	40.703
6.011	43.590];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(14.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CaltSilv2005';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed; eurybathic, eurythermic';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00468 * (TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78WQ4'; % Cat of Life
metaData.links.id_ITIS = '564241'; % ITIS
metaData.links.id_EoL = '46560851'; % Ency of Life
metaData.links.id_Wiki = 'Rioraja_agassizii'; % Wikipedia
metaData.links.id_ADW = 'Rioraja_agassizii'; % ADW
metaData.links.id_Taxo = '186177'; % Taxonomicon
metaData.links.id_WoRMS = '282619'; % WoRMS
metaData.links.id_fishbase = 'Rioraja-agassizii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rioraja_agassizii}}'; 
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
bibkey = 'CaltSilv2005'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF18010}, ' ...
'author = {F. P. Caltabellotta and F. M. Silva and F. S. Motta and O. B. F. Gadig}, ' ...
'year = {2005}, ' ...
'title  = {Age and growth of the threatened endemic skate \emph{Rioraja agassizii} ({C}hondrichthyes, {A}rhynchobatidae) in the western {S}outh {A}tlantic}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Rioraja-agassizii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  