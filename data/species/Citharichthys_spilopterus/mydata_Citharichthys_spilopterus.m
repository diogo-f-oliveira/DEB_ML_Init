function [data, auxData, metaData, txtData, weights] = mydata_Citharichthys_spilopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Citharichthys_spilopterus'; 
metaData.species_en = 'Bay whiff'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 14];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'DiasFiad2005'; 
data.Li  = 21;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm: pi/6*0.075^3';
data.Wwp = 13.6;  units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';      bibkey.Wwp = {'fishbase','DiasFiad2005'};
  comment.Wwp = 'based on 0.00631*Lp^3.12, see F1';
data.Wwi = 84.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.12, see F1';
 
data.Ri  = 6e4/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DiasFiad2005';   
 temp.Ri = C2K(25.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... % time since birth (d), total length (cm)
165.646	5.981
319.757	8.652
365+15.570	9.540
365+73.598	10.328
365+103.767	11.023
365+196.610	12.404
365+225.413	11.894
365+256.520	12.187
365+287.614	12.982
365+320.585	12.973]; 
data.tL(:,1) = data.tL(:,1) + 170; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(10.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SancYane2008'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% set2 = {'tL_fC','tL_mC'}; subtitle2 = {'Data for females, males in Central California'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00631*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVD'; % Cat of Life
metaData.links.id_ITIS = '172743'; % ITIS
metaData.links.id_EoL = '46570506'; % Ency of Life
metaData.links.id_Wiki = 'Citharichthys_spilopterus'; % Wikipedia
metaData.links.id_ADW = 'Citharichthys_spilopterus'; % ADW
metaData.links.id_Taxo = '46919'; % Taxonomicon
metaData.links.id_WoRMS = '275809'; % WoRMS
metaData.links.id_fishbase = 'Citharichthys-spilopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Citharichthys_spilopterus}}';
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
bibkey = 'DiasFiad2005'; type = 'article'; bib = [ ... 
 'doi = {10.1590/S1679-62252005000300009},' ...
'author = {June Ferraz Dias and Carla Bertolucci Fiadi and Helcy Lylian Nogueira Silbiger and Lucy Satiko Hashimoto Soares}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive and population dynamics of the Bay whiff \emph{Citharichthys spilopterus} {G}\"{u}nther, 1862 ({P}leuronectiformes: {P}aralichthyidae) in the {M}amangu\''{a} {I}nlet, {R}io de {J}aneiro, {B}razil}, ' ...
'journal = {Neotrop. ichthyol.}' ...
'volume = {3(3)}, ' ...
'pages = {411-419}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SancYane2008'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.seares.2007.12.002}, ' ...
'author = {Patricia S\''{a}nchez-Gil and Alejandro Y\''{a}\~{n}ez-Arancibia and Margarito Tapia and John W. Day and Charles A. Wilson and James H. Cowan}, ' ...
'year = {2008}, ' ...
'title = {Ecological and biological strategies of \emph{Etropus crossotus} and \emph{Citharichthys spilopterus} ({P}leuronectiformes: {P}aralichthyidae) related to the estuarine plume, {S}outhern {G}ulf of {M}exico}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {59}, ' ...
'pages = {173–185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Citharichthys-spilopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

