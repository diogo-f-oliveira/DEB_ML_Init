  function [data, auxData, metaData, txtData, weights] = mydata_Hiodon_tergisus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Hiodontiformes'; 
metaData.family     = 'Hiodontidae';
metaData.species    = 'Hiodon_tergisus'; 
metaData.species_en = 'Mooneye'; 

metaData.ecoCode.climate = {'Dwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'L_t'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 04 28];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2016 10 20];                           
metaData.email_mod_1    = {'Bas.Kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 20]; 

%% set data
% zero-variate data
data.ap = 4*365; units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = 'Wiki';
  temp.ap = C2K(12);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temps for all data sre guessed; ap = 6 yr for males';
data.am = 11*365;units.am = 'd';    label.am = 'life span';               bibkey.am = 'tolweb';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 0.85;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Wiki';
data.L365 = 20;   units.L365 = 'cm';   label.L365 = 'total length at 1 yr';bibkey.L365 = 'Wiki';
  temp.L365 = C2K(12); units.temp.L365 = 'K'; label.temp.L365 = 'temperature';
data.Li = 29.8;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki'; 
  comment.Li = 'fishbase: 47 cm';

data.Wwi = 226;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki'; 
  comment.Wwi = 'fishbase: 907 g';
  
data.Ri = 2e4/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);
weights.L365 = 5 * weights.L365;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts 
F1 = 'Mooneye eggs are covered in a gelatinous material similar to frog eggs.';
metaData.bibkey.F1 = 'tolweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LYQM'; % Cat of Life
metaData.links.id_ITIS = '161906'; % ITIS
metaData.links.id_EoL = '207393'; % Ency of Life
metaData.links.id_Wiki = 'Hiodon_tergisus'; % Wikipedia
metaData.links.id_ADW = 'Hiodon_tergisus'; % ADW
metaData.links.id_Taxo = '42725'; % Taxonomicon
metaData.links.id_WoRMS = '590492'; % WoRMS
metaData.links.id_fishbase = 'Hiodon-tergisus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hiodontidae}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2667}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'tolweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://tolweb.org/Hiodon_tergisus/15148}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
