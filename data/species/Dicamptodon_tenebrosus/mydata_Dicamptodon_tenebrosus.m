function [data, auxData, metaData, txtData, weights] = mydata_Dicamptodon_tenebrosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Dicamptodontidae';
metaData.species    = 'Dicamptodon_tenebrosus'; 
metaData.species_en = 'Coastal giant salamander'; 
metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bFc', 'biTf'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 20]; 


%% set data
% zero-variate data

data.ab = 7*30.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 21*30.5;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'ADW';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 5.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'data for Dicamptodon ensatus';

data.Lb  = 3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ADW';
data.Lj  = 13.2;      units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'ADW';
  comment.Lj = '92 till 166 mm';
data.Lp  = 19.2;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'amphibiaweb'; 
  comment.Lp = 'converted from 11.5cm SVL: tail is 40% of TL, EoL';
data.Li  = 34;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwi = 114;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 110/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '83 till 146 eggs/clutch';
  
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

%% Facts
F1 = 'This species is one of the few salamanders capable of vocalizing';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Some larva continue to grow into an adult and become sexually mature without losing their external gills';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'D. tenebrosus has until recently been included in D. ensatus and these species interbreed';
metaData.bibkey.F3 = 'EoL'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '35HZV'; % Cat of Life
metaData.links.id_ITIS = '550242'; % ITIS
metaData.links.id_EoL = '330494'; % Ency of Life
metaData.links.id_Wiki = 'Dicamptodon_tenebrosus'; % Wikipedia
metaData.links.id_ADW = 'Dicamptodon_tenebrosus'; % ADW
metaData.links.id_Taxo = '137953'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Dicamptodon+tenebrosus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicamptodon_tenebrosus}}';
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
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Dicamptodon+tenebrosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/330494/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Dicamptodon_tenebrosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dicamptodon_ensatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

