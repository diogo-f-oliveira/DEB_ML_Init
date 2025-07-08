function [data, auxData, metaData, txtData, weights] = mydata_Platygobio_gracilis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Platygobio_gracilis'; 
metaData.species_en = 'Flathead chub'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 26]; 

%% set data
% zero-variate data

data.am = 4.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'MartSchm1978';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'MartSchm1978'; 
  comment.Lp = 'based on SL 2.6 cm and F2';
data.Li = 32;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 

data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Goul1985';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 7.3;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'MartSchm1978','fishbase'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 306;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';
  

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 7.38
2 10.80
3 13.02
4 14.80];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MartSchm1978'; 

% time-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
10 2094
11 4035
12 5516
13 5810
14 5678];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MartSchm1978'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is the preferred one, but varied between 7 and 27 C';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4JRS8'; % Cat of Life
metaData.links.id_ITIS = '163882'; % ITIS
metaData.links.id_EoL = '205609'; % Ency of Life
metaData.links.id_Wiki = 'Platygobio_gracilis'; % Wikipedia
metaData.links.id_ADW = 'Platygobio_gracilis'; % ADW
metaData.links.id_Taxo = '184007'; % Taxonomicon
metaData.links.id_WoRMS = '567544'; % WoRMS
metaData.links.id_fishbase = 'Platygobio-gracilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Platygobio_gracilis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Platygobio-gracilis.html}}';  
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
bibkey = 'MartSchm1978'; type = 'Article'; bib = [ ... 
'author = {H. Al Martyn and James C. Schmulbach}, ' ... 
'year = {1978}, ' ...
'title = {Bionomics of the Flathead Chub, \emph{Hybopsis gracilis} ({R}ichardson)}, ' ...
'journal = {Proceedings of the Iowa Academy of Science}, ' ...
'volume = {85}, ' ...
'pages = {Article 5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Goul1985'; type = 'Article'; bib = [ ... 
'author = {William Gould}, ' ... 
'year = {1985}, ' ...
'title = {ASPECTS OF THE BIOLOGY OF THE FLATHEAD CHUB (\emph{Hybopsis gracilis}) IN {M}ONTANA}, ' ...
'volume = {45(2)}, ' ...
'pages = {332-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

