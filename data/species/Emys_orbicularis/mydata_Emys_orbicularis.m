function [data, auxData, metaData, txtData, weights] = mydata_Emys_orbicularis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Emys_orbicularis'; 
metaData.species_en = 'European pond turtle'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 04];

%% set data
% zero-variate data

data.ab = 95;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.ap = 5.5*365;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'ADW';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 120*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';          bibkey.Lb  = 'emys_home';
data.Lp  = 12.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';   bibkey.Lp  = 'ADW'; 
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';bibkey.Li  = 'dinoanimals';
  comment.Li = 'upto 38 cm (Wiki), but rarely larger than 20 cm (dinoanimals)';

data.Wwb = 5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'emys_home';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), straight carapace length (cm)
14.660	2.811
44.944	3.407
75.215	4.113
105.968	4.380
135.435	4.668
166.193	4.891
196.929	5.290];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'straight carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MasiFice2015';

% time-weight
data.tW = [ ... % time (d), wet weight (g)
15.000	6.200
45.357	11.095
75.715	15.989
106.500	20.885
136.430	30.195
168.498	37.079
198.428	47.273];
data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MasiFice2015';

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
F1 = 'If eggs develop below 25 C males hatch, above 30 C females';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Males are smaller than females and reach puberty earlier';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '39LXD'; % Cat of Life
metaData.links.id_ITIS = '551943'; % ITIS
metaData.links.id_EoL = '1056912'; % Ency of Life
metaData.links.id_Wiki = 'Emys_orbicularis'; % Wikipedia
metaData.links.id_ADW = 'Emys_orbicularis'; % ADW
metaData.links.id_Taxo = '48623'; % Taxonomicon
metaData.links.id_WoRMS = '999896'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Emys&species=orbicularis'; % ReptileDB
metaData.links.id_AnAge = 'Emys_orbicularis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Emys_orbicularis}}';
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
bibkey = 'MasiFice2015'; type = 'Article'; bib = [ ... 
'author = {S. Masin and G. F. Ficetola and L. Bottoni}, ' ... 
'year = {2015}, ' ...
'title = {Head Starting European Pond Turtle (\emph{Emys orbicularis}) for Reintroduction: Patterns of Growth Rates}, ' ...
'journal = {Herpetological Conservation and Biology}, ' ...
'volume = {10(Symposium)}, ' ...
'pages = {516-524}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Emys_orbicularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Emys_orbicularis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'emys_home'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.emys-home.de/ENGorbicularis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'dinoanimals'; type = 'Misc'; bib = ...
'howpublished = {\url{http://dinoanimals.com/animals/european-pond-turtle-emys-orbicularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

