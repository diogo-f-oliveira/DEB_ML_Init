function [data, auxData, metaData, txtData, weights] = mydata_Hydrodamalis_gigas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Sirenia'; 
metaData.family     = 'Dugongidae';
metaData.species    = 'Hydrodamalis_gigas'; 
metaData.species_en = 'Steller''s sea cow'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHa'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 17]; 

%% set data
% zero-variate data

data.tg = 450; units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(33.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Based on Steller''s estimate of more than a year';
data.tx = 450;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(33.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on observation that tx is similar to tg';
data.tp = 6*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(33.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 100*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(33.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on max age of much smaller Dugong';

data.Lb  = 318;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'guess based on (Wwb/Wwi)^(1/3)*Li';
data.Li  = 900;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwb = 855e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on same relative weight, compared to Dugong; probably an overestimation';
data.Wwi = 11.196e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  
data.Ri  = 0.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(33.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guess based on gestion of more than a yr';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature guessd from Dugong';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Extinct since 1887';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Unlike other sirenians, it was positively buoyant, meaning that it was unable to completely submerge';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Hydrodamalis was characterized by increased size, and a loss of teeth and phalanges; fed on kelp';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3N6WP'; % Cat of Life
metaData.links.id_ITIS = '180681'; % ITIS
metaData.links.id_EoL = '46559231'; % Ency of Life
metaData.links.id_Wiki = 'Hydrodamalis_gigas'; % Wikipedia
metaData.links.id_ADW = 'Hydrodamalis_gigas'; % ADW
metaData.links.id_Taxo = '69421'; % Taxonomicon
metaData.links.id_WoRMS = '255025'; % WoRMS
metaData.links.id_MSW3 = '11600008'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydrodamalis_gigas}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hydrodamalis_gigas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Hydrodamalis_gigas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

