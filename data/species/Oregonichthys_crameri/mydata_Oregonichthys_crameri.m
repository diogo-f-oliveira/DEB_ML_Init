  function [data, auxData, metaData, txtData, weights] = mydata_Oregonichthys_crameri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Oregonichthys_crameri'; 
metaData.species_en = 'Oregon chub'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.ab = 8.5;   units.ab = 'd';  label.ab = 'age at birth';                      bibkey.ab = 'ScheMcDo2003';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7-10 d';
data.am = 9*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ScheMcDo2003';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'ScheMcDo2003'; 
data.Li = 6.9;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'Anon1998';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.0 mm: pi/6*0.1^3';
data.Wwi = 3.3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F1';

data.Ri  = 671/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Anon1998';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (inch)
1 3.28
2 3.99
3 4.48
4 4.89
5 5.19
6 5.44
7 5.67
8 5.88
9 6.11];
data.tL(:,1) = (.9 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ScheMcDo2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891 * (TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6SSNJ'; % Cat of Life
metaData.links.id_ITIS = '163879'; % ITIS
metaData.links.id_EoL = '211699'; % Ency of Life
metaData.links.id_Wiki = 'Oregonichthys_crameri'; % Wikipedia
metaData.links.id_ADW = 'Oregonichthys_crameri'; % ADW
metaData.links.id_Taxo = '182100'; % Taxonomicon
metaData.links.id_WoRMS = '1018202'; % WoRMS
metaData.links.id_fishbase = 'Oregonichthys-crameri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oregonichthys-crameri}}';  
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
bibkey = 'ScheMcDo2003'; type = 'article'; bib = [ ...  
'author = {Paul D. Scheerer and Patrick J. McDonald}, ' ...
'year = {2003}, ' ...
'title = {Age, Growth, and Timing of Spawning of an Endangered Minnow, the {O}regon Chub (\emph{Oregonichthys crameri}), in the {W}illamette {B}asin, {O}regon}, ' ... 
'pages = {68-79}, ' ...
'volue = {84(2)}, ' ...
'journal = {Northwestern Naturalist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oregonichthys-crameri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Anon1998'; type = 'techreport'; bib = [ ...  
'author = {Anonymous}, ' ...
'year = {1998}, ' ...
'title = {Oregon Chub (\emph{Oregonichthys Crameri}): Recovery Plan}, ' ...
'institution = {US Fish and Wildlife Service, Oregon State Offfice, Portland, Oregon}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

