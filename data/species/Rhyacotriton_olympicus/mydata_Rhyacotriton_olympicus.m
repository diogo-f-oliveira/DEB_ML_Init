function [data, auxData, metaData, txtData, weights] = mydata_Rhyacotriton_olympicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Rhyacotritonidae';
metaData.species    = 'Rhyacotriton_olympicus'; 
metaData.species_en = 'Olympic torrent salamander'; 
metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bFc', 'biTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(7); % K, body temp
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

data.ab = 270;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 4.5*365;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'ADW';   
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 11*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Lp and growth rate from (0,Lb) till (tj,Lj)';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'ADW gives > 10 yr; probably more than 30 yr, in view of low temp';

data.Lb  = 1.3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ADW';
  comment.Lb = 'EoL gives 22 mm TL and 13.5 mm SVL';
data.Lj  = 3.5;      units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'ADW';
data.Lp  = 5.3;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on Plethodon_cinereus';
data.Li  = 9.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwi = 0.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on Plethodon_cinereus';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SP9M'; % Cat of Life
metaData.links.id_ITIS = '173745'; % ITIS
metaData.links.id_EoL = '1018900'; % Ency of Life
metaData.links.id_Wiki = 'Rhyacotriton_olympicus'; % Wikipedia
metaData.links.id_ADW = 'Rhyacotriton_olympicus'; % ADW
metaData.links.id_Taxo = '47363'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhyacotriton+olympicus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhyacotriton_olympicus}}';
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
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rhyacotriton+olympicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1018900/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Rhyacotriton_olympicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

