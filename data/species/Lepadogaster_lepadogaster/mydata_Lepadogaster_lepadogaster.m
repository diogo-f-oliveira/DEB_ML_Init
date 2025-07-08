function [data, auxData, metaData, txtData, weights] = mydata_Lepadogaster_lepadogaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiesociformes'; 
metaData.family     = 'Gobiesocidae';
metaData.species    = 'Lepadogaster_lepadogaster'; 
metaData.species_en = 'Shore clingfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMi', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 27]; 

%% set data
% zero-variate data

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'TojeFari2012';   
  temp.ab = C2K(16.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 500;    units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'guess';
  temp.ap = C2K(16.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(18);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.52;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'TojeFari2012';  
data.L18  = 1.12; units.L18  = 'cm'; label.L18  = 'total length at 18 dph';  bibkey.L18  = 'TojeFari2012';  
  temp.L18 = C2K(18);  units.temp.L18 = 'K'; label.temp.L18 = 'temperature'; 
data.Lp  = 4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = {'guess'}; 
data.Li  = 6.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwi = 6.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Calculated from 0.02307 * Li^3, based on fishbase';

data.Ri = 123/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'TojeFari2012';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
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
D1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
D2 = 'Author_mod_1: I was surprised to observe that the weights coefficient for ab changed so much the parameter values';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'W = 0.02307 * L^3';
metaData.bibkey.F1 = 'fishbase'; 
F2 = ['Mouth and anus open at hatch, almost no yolk. ', ...
     'Demersal eggs are deposited on the underside of stones, with the male guarding the egg mass which  may contain multiple batches at different stages of development. ', ...
     'L. lepadogaster breeds mainly during the spring until the beginning of the summer (March to July). ', ...
     'L. purpurea breeds mainly during the winter until the beginning of the spring (October to April). ', ...
     'L. purpurea ranges from Scotland to Senegal, the Canary and Madeira Islands and the Mediterranean;', ...
     'L. lepadogaster occurs from as far north as the extreme north-west of Galicia (Spain) to north-west Africa, the Canary and Madeira Islands and the Mediterranean'];
metaData.bibkey.F2 = 'TojeFari2012'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6P8C5'; % Cat of Life
metaData.links.id_ITIS = '164478'; % ITIS
metaData.links.id_EoL = '46566392'; % Ency of Life
metaData.links.id_Wiki = 'Lepadogaster_lepadogaster'; % Wikipedia
metaData.links.id_ADW = 'Lepadogaster_lepadogaster'; % ADW
metaData.links.id_Taxo = '435688'; % Taxonomicon
metaData.links.id_WoRMS = '126518'; % WoRMS
metaData.links.id_fishbase = 'Lepadogaster-lepadogaster'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepadogaster_lepadogaster}}';
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
bibkey = 'TojeFari2012'; type = 'Article'; bib = [ ... 
'author = {I. Tojeira and A. M. Faria and S. Henriques and C. Faria and E. J. Gon\c{c}alves}, ' ... 
'year = {2012}, ' ...
'title = {Early development and larval behaviour of two clingfishes, \emph{Lepadogaster purpurea} and \emph{Lepadogaster lepadogaster} ({P}isces: {G}obiesocidae)}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {93}, ' ...
'pages = {449--459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/643}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

