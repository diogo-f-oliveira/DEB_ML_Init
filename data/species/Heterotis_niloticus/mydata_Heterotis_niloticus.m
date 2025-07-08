  function [data, auxData, metaData, txtData, weights] = mydata_Heterotis_niloticus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Arapaimidae';
metaData.species    = 'Heterotis_niloticus'; 
metaData.species_en = 'African bonytongue'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 23];

%% set data
% zero-variate data
data.ab = 8.5;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 100;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'More1982';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 633;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01190*Lp^2.95, see F1';
data.Wwi = 9.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01190*Li^2.95, see F1';
  
data.Ri = 2.3e4/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';   bibkey.Ri = 'More1982';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 12620 at 5280 g: 12620*9.5e3/5280';
 
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (cm)
0.461	24.252
0.973	32.743
1.484	45.993
1.984	53.889
2.484	65.205
3.008	74.291
3.484	77.725
3.997	83.986]; % cm, physical length at f and T
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = 1.1*data.tL(:,2); % SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'More1982';
cooment.tL = 'Data from Nyong';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01190*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '3LF3Q'; % Cat of Life
metaData.links.id_ITIS = '649800'; % ITIS
metaData.links.id_EoL = '994820'; % Ency of Life
metaData.links.id_Wiki = 'Heterotis_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Heterotis_niloticus'; % ADW
metaData.links.id_Taxo = '42704'; % Taxonomicon
metaData.links.id_WoRMS = '581703'; % WoRMS
metaData.links.id_fishbase = 'Heterotis-niloticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterotis_niloticus}}';  
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
bibkey = 'More1982'; type = 'Article'; bib = [ ...    
'author = {Moreau, J.}, ' ...
'year  = {1982}, ' ...
'title = {Exposé synoptique des donn\''{e}es biologiques sur \emph{Heterotis niloticus} ({C}uvier, 1829)}, ' ...  
'journal = {FAO Fish. Synop.}, ' ...
'volume = {131}, ' ...
'pages = {1-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeroHech1988'; type = 'Misc'; bib = [ ... 
'title = {Growth of African freshwater fishes},'...
'author = {B. de Merona and T. Hecht and J. Moreau},'...
'year = {1988},'...
'howpublished = {\url{https://horizon.documentation.ird.fr/exl-doc/pleins_textes/pleins_textes_5/pt5/travaux_d/26396.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.mnhn.fr/summary/Heterotis-niloticus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
