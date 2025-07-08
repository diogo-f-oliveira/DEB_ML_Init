function [data, auxData, metaData, txtData, weights] = mydata_Notropis_heterolepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_heterolepis'; 
metaData.species_en = 'Blacknose shiner'; 

metaData.ecoCode.climate = {'Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 14]; 

%% set data
% zero-variate data

data.am = 1.2*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'EmerWall1974';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.3;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'RobeBroo2006'; 
data.Li = 8.23;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishbase'; 
  comment.Li = 'based on TL 9.8 cm, and F2';  

data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'RobeBroo2006';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwi = 8.0;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*(Li/0.84)^3.08, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (mnth), std length (cm)
 5 3.34
 6 3.59
16 4.56
18 4.61];
data.tL(:,1) = 30.5 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EmerWall1974'; 
comment.tL = 'Data from length frequency counts';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
3.400	97.471
3.683	148.833
3.889	154.086
4.391	257.393
4.886	331.518];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RobeBroo2006'; 
comment.LN = 'Data from May';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed nor to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZGX'; % Cat of Life
metaData.links.id_ITIS = '163446'; % ITIS
metaData.links.id_EoL = '47261961'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_heterolepis'; % Wikipedia
metaData.links.id_ADW = 'Notropis_heterolepis'; % ADW
metaData.links.id_Taxo = '181508'; % Taxonomicon
metaData.links.id_WoRMS = '1017934'; % WoRMS
metaData.links.id_fishbase = 'Notropis-heterolepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_heterolepis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-heterolepis.html}}';  
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
bibkey = 'RobeBroo2006'; type = 'article'; bib = [ ... 
'author = {Matt E. Roberts and Brooks M. Burr and Matt R. Whiles and Victor J. Santucci}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive Ecology and Food Habits of the Blacknose Shiner, \emph{Notropis heterolepis}, in {N}orthern {I}llinois}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {155(1)}, ' ...
'pages = {70-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EmerWall1974'; type = 'article'; bib = [ ... 
'author = {Lee Emery and Dale C. Wallace}, ' ... 
'year = {1974}, ' ...
'title = {The Age and Growth of the Blacknose Shiner, \emph{Notropis heterolepis} {E}igenmann and {E}igenmann}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {91(1)}, ' ...
'pages = {242-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

