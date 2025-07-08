function [data, auxData, metaData, txtData, weights] = mydata_Pipistrellus_pipistrellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Pipistrellus_pipistrellus'; 
metaData.species_en = 'Common pipistrelle';

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 


%% set data
% zero-variate data

data.tg = 42;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'RaceSwif1981';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 256;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(34);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(34);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 4;    units.Li  = 'cm';  label.Li  = 'ultimate haed-body length';  bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki: 3.5-5.2 cm';

data.Wwb = 1.125; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 3.5-8.5 g';

data.Ri  = 1.2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight for foetus
data.tWe_1978 = [ ... time (d), foetal weight^{1/3} (g^{1/3})
4.131	0.441
9.668	0.550
15.666	0.695
20.625	0.917
27.159	1.096];
data.tWe_1978(:,2) = data.tWe_1978(:,2).^3; % remove transformation
units.tWe_1978  = {'d', 'g'};  label.tWe_1978 = {'age', 'foetal wet weight'};  
temp.tWe_1978   = C2K(34);  units.temp.tWe_1978 = 'K'; label.temp.tWe_1978 = 'temperature';
bibkey.tWe_1978 = 'RaceSwif1981';
%
data.tWe_1979 = [ ... time (d), foetal weight^{1/3} (g^{1/3})
4.106	0.331
9.344	0.451
15.556	0.541
20.881	0.712
25.898	0.861
31.127	0.945
35.313	1.090];
data.tWe_1979(:,2) = data.tWe_1979(:,2).^3; % remove transformation
units.tWe_1979  = {'d', 'g'};  label.tWe_1979 = {'age', 'foetal wet weight'};  
temp.tWe_1979   = C2K(34);  units.temp.tWe_1979 = 'K'; label.temp.tWe_1979 = 'temperature';
bibkey.tWe_1979 = 'RaceSwif1981';
comment.tWe_1978 = '1979 was poor in insects (locally), lowever body temp, longer gestation time';
  
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

%% Group plots
set1 = {'tWe_1978','tWe_1979'}; subtitle1 = {'Data from 1978, 1979'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'body temp 34C at envir temp 22C while feeding, but 25C while startving 24 h before recording';
metaData.bibkey.F1 = 'RaceSwif1981'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7WHKT'; % Cat of Life
metaData.links.id_ITIS = '945959'; % ITIS
metaData.links.id_EoL = '127390'; % Ency of Life
metaData.links.id_Wiki = 'Pipistrellus_pipistrellus'; % Wikipedia
metaData.links.id_ADW = 'Pipistrellus_pipistrellus'; % ADW
metaData.links.id_Taxo = '169449'; % Taxonomicon
metaData.links.id_WoRMS = '1049382'; % WoRMS
metaData.links.id_MSW3 = '13802094'; % Mammal Spec World
metaData.links.id_AnAge = 'Pipistrellus_pipistrellus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pipistrellus_pipistrellus}}';
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
bibkey = 'RaceSwif1981'; type = 'Article'; bib = [ ... 
'author = {Racey, P. A. and Swift, S. M.}, ' ... 
'year = {1981}, ' ...
'title = {Variations in gestation length in a colony of pipistrelle bats (\emph{Pipistrellus pipistrellus}) from year to year}, ' ...
'journal = {J. Reprod. Fertil.}, ' ...
'volume = {61}, ' ...
'pages = {123--129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pipistrellus_pipistrellus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

