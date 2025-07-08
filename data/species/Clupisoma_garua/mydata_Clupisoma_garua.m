  function [data, auxData, metaData, txtData, weights] = mydata_Clupisoma_garua
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ailiidae';
metaData.species    = 'Clupisoma_garua'; 
metaData.species_en = 'Garua bachcha'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 27];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'HasaHose2020';
data.Li = 60.9;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 3.3e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.4 mm: pi/6*0.04^3';
data.Wwp = 15.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00575*Lp^3.08, see F1';
data.Wwi = 1.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.08, see F1';

data.GSI = 0.1878; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'HasaHose2020';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm)
245.944	10.842
335.236	17.500
365+89.292	24.348
365+152.736	25.679];
data.tL(:,1) = data.tL(:,1) -90; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RayKuma2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BCCM'; % Cat of Life
metaData.links.id_ITIS = '640201'; % ITIS
metaData.links.id_EoL = '206160'; % Ency of Life
metaData.links.id_Wiki = 'Clupisoma_garua'; % Wikipedia
metaData.links.id_ADW = 'Clupisoma_garua'; % ADW
metaData.links.id_Taxo = '160258'; % Taxonomicon
metaData.links.id_WoRMS = '279526'; % WoRMS
metaData.links.id_fishbase = 'Clupisoma-garua'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupisoma_garua}}';  
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
bibkey = 'RayKuma2022'; type = 'Article'; bib = [ ...
'doi = {10.21077/ijf.2022.69.2.115676-04}, ' ...
'author = {Archisma Ray and Lohith Kumar and Himanshu Sekhar Swain and B. K. Das}, ' ...
'year = {2022}, ' ...
'title = {Growth, mortality and stock status of three commercially important catfishes from the {R}iver {G}anga, {I}ndia}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {69(2)}, '...
'pages = {30-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HasaHose2020'; type = 'Article'; bib = [ ...
'doi = {10.21077/ijf.2022.69.2.115676-04}, ' ...
'author = {Mehedi Hasana and Md. Hafiz All Hosen and  Md. Idris Miaha and Zoarder Faruque Ahmeda and Mousumi Sarker Chhandac and Sheik Istiak Md. Shahriar}, ' ...
'year = {2020}, ' ...
'title = {Fecundity, length at maturity and gonadal development indices of river catfish (\emph{Clupisoma garua}) of the old {B}rahmaputra {R}iver in {B}angladesh}, ' ... 
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {46(3)}, '...
'pages = {259-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupisoma-garua.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

