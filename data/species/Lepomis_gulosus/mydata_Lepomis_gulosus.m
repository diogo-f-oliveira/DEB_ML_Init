  function [data, auxData, metaData, txtData, weights] = mydata_Lepomis_gulosus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Lepomis_gulosus'; 
metaData.species_en = 'Warmouth'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
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
data.ab = 36/24;   units.ab = 'd';  label.ab = 'age at birth';                      bibkey.ab = 'fishesoftexas';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishesoftexas: in practice 3 yr';

data.Lp = 7.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishesoftexas'; 
data.Li = 31;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.0 mm: pi/6*0.1^3';
data.Wwi = 673; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.11, see F1';

data.Ri  = 63200/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishesoftexas';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (inch)
1  3.74
2  5.85
3  8.42
4 10.30
5 12.89];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GashBass1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

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
F1 = 'length-weight: Ww in g = 0.01549 * (TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TG2G'; % Cat of Life
metaData.links.id_ITIS = '168138'; % ITIS
metaData.links.id_EoL = '995126'; % Ency of Life
metaData.links.id_Wiki = 'Lepomis_gulosus'; % Wikipedia
metaData.links.id_ADW = 'Lepomis_gulosus'; % ADW
metaData.links.id_Taxo = '178460'; % Taxonomicon
metaData.links.id_WoRMS = '1044805'; % WoRMS
metaData.links.id_fishbase = 'Lepomis-gulosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepomis_gulosus}}';  
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
bibkey = 'GashBass1973'; type = 'techreport'; bib = [ ...  
'author = {Stephen L. Gash and J. Carl Bass}, ' ...
'year = {1973}, ' ...
'title = {Age, Growth and Population Structures of Fishes from Acid and Alkaline Strip-Mine Lakes in {S}outheast {K}ansas}, ' ... 
'pages = {39-50}, ' ...
'volue = {76}, ' ...
'journal = {Transactions of the Kansas Academy of Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepomis-gulosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/lepomis gulosus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

