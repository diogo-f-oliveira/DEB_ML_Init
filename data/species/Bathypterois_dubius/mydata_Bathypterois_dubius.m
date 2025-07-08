function [data, auxData, metaData, txtData, weights] = mydata_Bathypterois_dubius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Ipnopidae';
metaData.species    = 'Bathypterois_dubius'; 
metaData.species_en = 'Mediterranean spiderfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 03 11]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 11]; 

%% set data
% zero-variate data
data.am = 16*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'MoraMass1996';  
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.9;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'PorcFoll2010';
data.Li = 20.5;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 3.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'PorcFoll2010';
  comment.Wwb = 'based on egg diameter of 0.838 mm: pi/6*0.0838^3';
data.Wwi = 42; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^2.93, see F2';

data.GSI  = 0.075; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'MoraMass1996';   
temp.GSI = C2K(8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % age (yr), standard length (cm) 
 1  5.00 
 2  7.75 
 3  8.00 
 4  9.66 
 5 11.00 
 6 11.40 
 7 12.70 
 8 14.00 
 9 14.20 
10 15.50 
11 16.00 
12 15.90 
13 15.60 
14 15.50 
15 16.00];
data.tL(:,1) = 365 * (.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraMass1996';

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
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Peferred temperature 13 C, but bottum is between 4 and 12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'weight-length: Ww in g =  0.00603*(TL in cm)^2.93';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'KXSY'; % Cat of Life
metaData.links.id_ITIS = '162448'; % ITIS
metaData.links.id_EoL = '46563762'; % Ency of Life
metaData.links.id_Wiki = 'Bathypterois_dubius'; % Wikipedia
metaData.links.id_ADW = 'Bathypterois_dubius'; % ADW
metaData.links.id_Taxo = '163684'; % Taxonomicon
metaData.links.id_WoRMS = '126342'; % WoRMS
metaData.links.id_fishbase = 'Bathypterois-dubius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathypterois_dubius}}';
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
bibkey = 'MoraMass1996'; type = 'article'; bib = [ ...
'author = {B. Morales-Nine and E. Massuti and C. Stefanescu}, ' ... 
'year   = {1996}, ' ...
'title  = {Bathymetric distribution and growth patterns of \emph{Bathypterois mediterraneus} from the north-western {M}editerranean {S}ea}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {276-288}, ' ...
'volume = {49, suppl A}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PorcFoll2010'; type = 'article'; bib = [ ...
'doi = {10.1017/S0025315409991330}, ' ...
'author = {Cristina Porcu and Maria Cristina Follesa and Eleonora Grazioli and Anna Maria Deiana and Angelo Cau}, ' ... 
'year   = {2010}, ' ...
'title  = {Reproductive biology of a bathyal hermaphrodite fish, \emph{Bathypterois mediterraneus} ({O}steichthyes: {I}pnopidae) from the south-eastern {S}ardinian {S}ea (central-western {M}editerranean)}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'page = {719-728}, ' ...
'volume = {90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathypterois-dubius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

