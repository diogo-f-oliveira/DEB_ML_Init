function [data, auxData, metaData, txtData, weights] = mydata_Rostroraja_texana
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Rostroraja_texana'; 
metaData.species_en = 'Roundel skate '; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 08];

%% set data
% zero-variate data;
data.ab = 97; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(24.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'SuliIrvi2007';   
  temp.am = C2K(24.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 9;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'SuliIrvi2007';
data.Lp  = 53.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'SuliIrvi2007';
data.Li  = 62.4; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'SuliIrvi2007';

data.Wwi = 1.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.26';

data.Ri  = 35/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rostroraja_alba after size-correction';
  
% uni-variate data at f
% time - length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0 11.3 11.9
    1 20.9 19.8
    2 29.2 27.7
    3 36.6 33.7
    4 43.1 38.1
    5 47.9 41.3
    6 52.4 43.7
    7 55.2 45.3
    8 56.8 46.1
    9 58.3 NaN];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length','female'};  
temp.tL_fm = C2K(24.9); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SuliIrvi2007'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00269*(TL in cm)^3.26';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TFRS'; % Cat of Life
metaData.links.id_ITIS = '564123'; % ITIS
metaData.links.id_EoL = '46560594'; % Ency of Life
metaData.links.id_Wiki = 'Rostroraja_texana'; % Wikipedia
metaData.links.id_ADW = 'Rostroraja_texana'; % ADW
metaData.links.id_Taxo = '108298'; % Taxonomicon
metaData.links.id_WoRMS = '105896'; % WoRMS
metaData.links.id_fishbase = 'Rostroraja-texana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rostroraja_texana}}'; 
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
bibkey = 'SuliIrvi2007'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF06048}, ' ...
'author = {James A. Sulikowski and Sarah B. Irvine and Kate C. DeValerio and John K. Carlson}, ' ...
'year = {2007}, ' ...
'title  = {Age, growth and maturity of the roundel skate, \emph{Raja texana}, from the {G}ulf of {M}exico, {USA}}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58}, ' ...
'pages = {41–53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rostroraja-texana.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

