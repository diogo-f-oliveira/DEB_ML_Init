function [data, auxData, metaData, txtData, weights] = mydata_Cyclothone_pallida
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Gonostomatidae';
metaData.species    = 'Cyclothone_pallida'; 
metaData.species_en = 'Tan bristlemouth'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 02];

%% set data
% zero-variate data
data.am = 10*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(4.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.3;   units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 7.5; units.Li = 'cm';   label.Li = 'ultimate std length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MiyaNemo1986';
  comment.Wwb = 'based on egg diameter of 0.3 mm: pi/6*0.03^3';
data.Wwp = 0.31; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00389*Lp^2.99, see F1';  
data.Wwi = 1.6;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00389*Li^2.99, see F1';  

data.Ri  = 3000/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 20 cm';    bibkey.Ri  = 'MiyaNemo1986';   
  temp.Ri = C2K(4.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity 900 eggs, each 2 yr';

% uni-variate data
% time-length
data.tL = [ ... % time  yr) - std length (cm)
    1 1.85
    2 2.40
    3 2.95
    4 3.50
   5.5 4.50]; 
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(4.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MiyaNemo1986';

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

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '32YHS'; % Cat of Life
metaData.links.id_ITIS = '162167'; % ITIS
metaData.links.id_EoL = '46563203'; % Ency of Life
metaData.links.id_Wiki = 'Cyclothone_pallida'; % Wikipedia
metaData.links.id_ADW = 'Cyclothone_pallida'; % ADW
metaData.links.id_Taxo = '172519'; % Taxonomicon
metaData.links.id_WoRMS = '127288'; % WoRMS
metaData.links.id_fishbase = 'Cyclothone-pallida'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclothone_pallida}}';
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
bibkey = 'MiyaNemo1986'; type = 'article'; bib = [ ...
'doi = {10.1007/bf02110197}, ' ...
'author = {Miya, M. and Nemoto, T.}, ' ... 
'year   = {1986}, ' ...
'title  = {Some aspects of the biology of the micronektonic fish \emph{Cyclothone pallida} and \emph{C. acclinidens} ({P}isces: {G}onostomatidae) in {S}agami {B}ay, {C}entral {J}apan}, ' ...
'journal = {Journal of Oceanography}, ' ...
'page = {473–480}, ' ...
'volume = {42(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Cyclothone-pallida.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

