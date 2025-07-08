function [data, auxData, metaData, txtData, weights] = mydata_Flustra_foliacea

%% set metaData
metaData.phylum     = 'Bryozoa'; 
metaData.class      = 'Gymnolaemata'; 
metaData.order      = 'Cheilostomata'; 
metaData.family     = 'Flustridae';
metaData.species    = 'Flustra_foliacea'; 
metaData.species_en = 'Broad-leaved hornwrack'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-Wd'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 15]; 

%% set data
% zero-variate data

data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'This guess does not have a firm basis.';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 17;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
 
% uni-variate data
% time-length/weight
tLW = [... % time since birth (yr), colony height (cm), dry weight (mg)
1 1.00   2.1
2 2.12   5.9
3 3.20  13.2
4 4.36  21.6
5 5.35  36.8
6 6.09  55.9
7 7.11  86.9
8 7.93 109.1];
tLW(:,1) = tLW(:,1) * 365; % convert yr to d
data.tL = tLW(:,[1 2]);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'colony height'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Meno1975';
%
data.tW = tLW(:,[1 3]); 
units.tW   = {'d', 'mg'};  label.tW = {'time since birth', 'colony dry weight'};  
temp.tW    = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Meno1975';
  
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
F1 = 'data refer to colonies, which grow in leaves of constant thickness. Leaves consist of two layers of zooids and are formed when 2 encrusting colonies meet.';
metaData.bibkey.F1 = 'Meno1975'; 
F2 = 'colonies are encrusting in the first year';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Both encrusting and leaf part form reproductive stages, which differ in morphology';
metaData.bibkey.F3 = 'Blau2009'; 
F4 = 'Dry weight is roughly propto L^2.';
metaData.bibkey.F4 = 'Meno1975'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6JBVG'; % Cat of Life
metaData.links.id_ITIS = '155886'; % ITIS
metaData.links.id_EoL = '600545'; % Ency of Life
metaData.links.id_Wiki = 'Flustra_foliacea'; % Wikipedia
metaData.links.id_ADW = 'Flustra_foliacea'; % ADW
metaData.links.id_Taxo = '40579'; % Taxonomicon
metaData.links.id_WoRMS = '111367'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Flustra_foliacea}}';
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
bibkey = 'Meno1975'; type = 'Article'; bib = [ ... 
'author = {Menon, N. R.}, ' ... 
'year = {1975}, ' ...
'title = {Observations on growth of \emph{Flustra foliacea} ({B}ryozoa) from {H}elgoland waters}, ' ...
'journal = {Helgolaender wiss. Meeresunters.}, ' ...
'volume = {27}, ' ...
'pages = {163--267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Blau2009'; type = 'Book'; bib = [ ... 
'author = {H. de Blauwe}, ' ... 
'year = {2009}, ' ...
'title = {Mosdiertjes van de zuidelijke bocht van de Noordzee}, ' ...
'publisher = {Vlaams Instituut voor de Zee}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

