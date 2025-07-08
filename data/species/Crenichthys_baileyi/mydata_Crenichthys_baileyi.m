  function [data, auxData, metaData, txtData, weights] = mydata_Crenichthys_baileyi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Goodeidae';
metaData.species    = 'Crenichthys_baileyi'; 
metaData.species_en = 'White River springfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'dLb'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 07 28];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'sta@akvaplan.niva.no'};
metaData.date_acc    = [2020 07 28]; 


%% set data
% zero-variate data
data.ab = 6;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'Kope1949';
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tmeperature-corrected value for Empetrichthys_latos';
  
data.Lp = 3.4;     units.Lp = 'cm';     label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Empetrichthys_latos: 9*3.0/7.9';
data.Li = 9;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.6e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Kope1949';   
  comment.Wwb = 'based on egg diameter of 1.9 mm: pi/6*0.19^3';
data.Wwi = 8.9; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01122*Li^3.04, see F1';
   
data.Ri = 111/365;       units.Ri = '#/d';  label.Ri = 'reprod rate at TL 6.2/0.87';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on value for Empetrichthys_latos';
  
data.dLb = 0.02/0.875;  units.dLb = 'cm/d';  label.dLb = 'change in TL at birth';  bibkey.dLb = 'Kope1949';   
  temp.dLb = C2K(30); units.temp.dLb = 'K'; label.temp.dLb = 'temperature';
  comment.dLb = 'hatch at SL = 4.3 mm, at 87h post hatch SL 4.7 mm, at 15 d post hatch 7.3 mm and F2';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Warm water species';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.01122 * (TL in cm)^3.04';
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.875 * TL ';
    metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'ZCDM'; % Cat of Life
metaData.links.id_ITIS = '165687'; % ITIS
metaData.links.id_EoL = '1157167'; % Ency of Life
metaData.links.id_Wiki = 'Crenichthys_baileyi'; % Wikipedia
metaData.links.id_ADW = 'Crenichthys_baileyi'; % ADW
metaData.links.id_Taxo = '172191'; % Taxonomicon
metaData.links.id_WoRMS = '1019472'; % WoRMS
metaData.links.id_fishbase = 'Crenichthys-baileyi'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Crenichthys-baileyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Crenichthys_baileyi}}';
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
bibkey = 'Kope1949'; type = 'Article'; bib = [ ...  
'author = {John A. Kopec}, ' ...
'year = {1949}, ' ...
'title = {Ecology, Breeding Habits and Young Stages of \emph{Crenichthys baileyi}, a {C}yprinodont Fish of {N}evada}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1949(1)}, '...
'pages = { 56-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

