  function [data, auxData, metaData, txtData, weights] = mydata_Phalacronotus_micronemus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Phalacronotus_micronemus'; 
metaData.species_en = 'Lais'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 10 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 19];

%% set data
% zero-variate data
data.ab = 8;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 50;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Silurus glanis';
data.Wwp = 45;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','guess'}; 
 comment.Wwp = 'based on 0.00562*Lp^3.00, see F1';
data.Wwi = 702.5;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00562*Li^3.00, see F1; max published weight 8,5 kg';
  
data.Ri = 60; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Silurus_glanis: 9370*702.5/1.14e5';
  
% univariate data
% time-length
data.tL = [ ... % time (d), total length (cm)
90.462	10.548
151.244	10.836
212.033	11.836
365+89.529	15.328
365+151.626	15.717
365+180.218	16.624
730+90.238	20.107
730+120.468	20.505
730+152.009	20.700
1095+120.499	23.353
1095+151.060	24.056
1460+89.645	25.904
1460+119.538	25.590
1460+151.408	25.785
1460+211.866	26.582];
data.tL(:,1) = data.tL(:,1) + 200; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wula2022'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4FQSN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Phalacronotus'; % Wikipedia
metaData.links.id_ADW = 'Phalacronotus_micronemus'; % ADW
metaData.links.id_Taxo = 'Phalacronotus_micronemus'; % Taxonomicon
metaData.links.id_WoRMS = '1015059'; % WoRMS
metaData.links.id_fishbase = 'Phalacronotus-micronemus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Silurus_triostegus}}';  
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
bibkey = 'Wula2022'; type = 'Article'; bib = [ ...    
'doi = {10.1088/1755-1315/1118/1/012062}, ' ...
'author = {Wulandari, T.N.M.}, ' ...
'year  = {2022}, ' ...
'title = {Population dynamics of lais (\emph{Phalacronotus micronemus}) in {M}usi {S}tream, {S}outh {S}umatra}, ' ...  
'journal = {IOP Conference Series: Earth and Environmental Science}, ' ...
'volume = {1118(1)}, ' ...
'pages = {012062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Phalacronotus-micronemus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

