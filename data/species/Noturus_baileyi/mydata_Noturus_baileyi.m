function [data, auxData, metaData, txtData, weights] = mydata_Noturus_baileyi
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_baileyi'; 
metaData.species_en = 'Smoky madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 07 26]; 

%% set data
% zero-variate data;

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'DinkShut1996';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'DinkShut1996';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.8;  units.Lp  = 'cm';	label.Lp  = 'standard length at puberty';  bibkey.Lp  = 'DinkShut1996';
data.Li  = 7.3;   units.Li  = 'cm';	label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 1.28e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DinkShut1996'; 
  comment.Wwb = 'based on egg diameter of 2.5 to 3.3 mm: pi/6*0.29^3';
data.Wwi  = 4.6;   units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.01047*Li^3.06, see F1';

data.Ri  = 55/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DinkShut1996';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
 84.578 2.279	
163.969 2.769	
294.639 2.769	
364.547 3.240	
365+ 24.881 3.834	
365+ 59.046 4.229	
365+163.172 4.954	
365+257.965 5.246	
365+359.346 5.491	
730+23.460 5.727	
730+121.249 5.812	
730+255.548 5.868	
730+302.230 5.972];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DinkShut1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data varied between 5 and 26 C';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01047*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '74D68'; % Cat of Life
metaData.links.id_ITIS = '164007'; % ITIS
metaData.links.id_EoL = '208012'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_baileyi'; % Wikipedia
metaData.links.id_ADW = 'Noturus_baileyi'; % ADW
metaData.links.id_Taxo = '181562'; % Taxonomicon
metaData.links.id_WoRMS = '1013243'; % WoRMS
metaData.links.id_fishbase = 'Noturus-baileyi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_baileyi}}';
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
bibkey = 'DinkShut1996'; type = 'Article'; bib = [ ... 
'author = {Gerald R. Dinkins and Peggy W. Shute},'...
'title = {Life histories of \emph{Noturus baileyi} and \emph{Noturus flavipinni} ({P}isces; {I}ctaluridae) two rare madtom catfishes in {C}itico {C}reek, {M}onroe {C}ounty, {T}ennessee},'...
'journal = {Bulletin Alabama Mus. Nat. Hist.},'...
'volume = {18},'...
'year = {1996},'...
'pages = {43-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-baileyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

