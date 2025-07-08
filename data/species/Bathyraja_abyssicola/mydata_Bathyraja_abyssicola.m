function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_abyssicola

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_abyssicola'; 
metaData.species_en = 'Deepsea Skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
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
data.ab = 4*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 45*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Prov2016';   
  temp.am = C2K(3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 26.4;  units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Prov2016';
data.Lbm  = 23.7; units.Lbm  = 'cm';  label.Lbm  = 'total length at birth for males'; bibkey.Lbm  = 'Prov2016';
data.Lp  = 126.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'Prov2016';
data.Lpm  = 117.5;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'Prov2016';
data.Li  = 160;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Prov2016';

data.Wwi = 38.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1';

data.Ri  = 10/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
5.870	38.884
21.004	101.036
27.086	75.857
29.986	101.036
31.047	108.048
37.058	134.183
45.120	138.327];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Prov2016';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
5.921	34.989
7.039	40.118
16.974	60.969
20.066	76.656
20.987	64.609
24.013	78.789
25.921	86.635
29.934	83.947
30.921	99.923
35.000	98.139];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Prov2016';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00490 * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WDZS'; % Cat of Life
metaData.links.id_ITIS = '564114'; % ITIS
metaData.links.id_EoL = '46560752'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_abyssicola'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_abyssicola'; % ADW
metaData.links.id_Taxo = '163698'; % Taxonomicon
metaData.links.id_WoRMS = '271503'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-abyssicola'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_abyssicola}}'; 
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
bibkey = 'Prov2016'; type = 'phdthesis'; bib = [ ...
'author = {Cameron Murray Provost}, ' ...
'year = {2016}, ' ...
'title  = {Age, growth, and sexual maturity of the deepsea skate, \emph{Bathyraja abyssicola}}, ' ...
'school = {Alaska Pacific University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-abyssicola.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

