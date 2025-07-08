function [data, auxData, metaData, txtData, weights] = mydata_Channa_punctata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Channidae';
metaData.species    = 'Channa_punctata'; 
metaData.species_en = 'Spotted snake head'; 
metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas'; 'Bas Kooijman'};    
metaData.date_subm = [2014 04 26];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 09]; 



%% set data
% zero-variate data

data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'fishace';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;   units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'SaikSing2013';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 1100;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SaikSing2013';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.27; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'fishace';  
data.L20  = 0.72;   units.L20  = 'cm';  label.L20  = 'total length at 20 d';  bibkey.L20  = 'SaikSing2013';  
  temp.L20 = C2K(27);  units.temp.L20 = 'K'; label.temp.L20 = 'temperature'; 
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SaikSing2013'; 
data.Li  = 31;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'SaikSing2013';

data.Wwb = 5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SaikSing2013';
data.Wwp = 28;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'SaikSing2013';
data.Wwi = 300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SaikSing2013';

data.Ri  = 3e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'SaikSing2013';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max nr of eggs: 30000; 1 broods/year';
 
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
F1 = 'common fish that occurs between Iran and China. In countries like Taiwan, Cambodia they are cultured for their meat. They feed on frogs, insects, rodents, etc. It can breath air.';
metaData.bibkey.F1 = 'fishace'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TM48'; % Cat of Life
metaData.links.id_ITIS = '643058'; % ITIS
metaData.links.id_EoL = '204174'; % Ency of Life
metaData.links.id_Wiki = 'Channa_punctata'; % Wikipedia
metaData.links.id_ADW = 'Channa_punctata'; % ADW
metaData.links.id_Taxo = '170530'; % Taxonomicon
metaData.links.id_WoRMS = '280129'; % WoRMS
metaData.links.id_fishbase = 'Channa-punctata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Channa}}';
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
bibkey = 'SaikSing2013'; type = 'Article'; bib = [ ... 
'author = {Saika, A. K. and Singh, A. S. K. and Biswas, S. P.}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of \emph{Channa punctatus} ({B}loch) from paddy field of {S}ivasagar, {A}ssam.}, ' ...
'journal = {Int. J. Curr. Res.}, ' ...
'volume = {5}, ' ...
'number = {3}, '...
'pages = {542--546}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishace'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishace.com.au/snake/261puncta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

