function [data, auxData, metaData, txtData, weights] = mydata_Oplurus_cuvieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Opluridae';
metaData.species    = 'Oplurus_cuvieri'; 
metaData.species_en = 'Collared iguanid lizard'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 25];

%% set data
% zero-variate data

data.ab = 74;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Balc2006';   
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(29); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 9.3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess';  
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';  bibkey.Li  = {'EoL','Balc2006','RandMori2001'}; 
  comment.Li = 'based on TL 35 cm, using F1';

data.Ww0 = 4.2;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';       bibkey.Ww0 = 'RandMori2001';
data.Wwi = 114.63;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'EoL';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Balc2006';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
D1 = 'Males are assumed to not differ from females';
D2 = 'Temperatures are guessed, but that for ab is known';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'SVL = TL * 0.285';
metaData.bibkey.F1 = 'Balc2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6T44X'; % Cat of Life
metaData.links.id_ITIS = '1056422'; % ITIS
metaData.links.id_EoL = '791248'; % Ency of Life
metaData.links.id_Wiki = 'Oplurus_cuvieri'; % Wikipedia
metaData.links.id_ADW = 'Oplurus_cuvieri'; % ADW
metaData.links.id_Taxo = '642705'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Oplurus&species=cuvieri'; % ReptileDB
metaData.links.id_AnAge = 'Oplurus_cuvieri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oplurus_cuvieri}}';
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
bibkey = 'RandMori2001'; type = 'Article'; bib = [ ... 
'author = {Herilala J. A. R. Randdriamahazo and Akira Mori}, ' ... 
'year = {2001}, ' ...
'title = {Egg-Laying Activities and Reproductive Traits in Females of \emph{Oplurus cuvieri cuvieri}}, ' ...
'pages = {209-217}, ' ...
'volume = {35(2)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Balc2006'; type = 'Techreport'; bib = [ ... 
'author = {Michal Balcar}, ' ... 
'year = {2006}, ' ...
'title = {Breeding of {M}adagascan iguanian lizard}}, ' ...
'pages = {1-2}, ' ...
'institution = {Zoo Brno}, ' ...
'series = {Zoo Report Profi}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791248}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Oplurus_cyclurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'zoobrno'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.zoobrno.cz/en/our-animals/animals-kept/reptiles/oplurus-cuvieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];