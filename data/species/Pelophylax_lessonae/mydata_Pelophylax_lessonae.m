function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_lessonae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_lessonae'; 
metaData.species_en = 'Pool frog'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 10 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 29]; 


%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Gunt1990';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 120;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'Gunt1990';   
  temp.tj = C2K(15); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'SochOgie2010';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.89; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Gunt1990';  
data.Ljb  = 6.5; units.Ljb  = 'cm'; label.Ljb = 'total length of tadpole at metam';   bibkey.Ljb  = 'Gunt1990'; 
data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 3.9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Gunt1990'; 
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*7';
data.Li  = 7.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Gunt1990';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.2^3';
data.Wwj = 0.65; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 7;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 41.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gunt1990';
 
% uni-variate data

% length-weight-fecundity
LWN = [ ... % body length (cm), wet weight (g), number of eggs (#) 
5.2 13.0  985
5.3 12.3  589
5.6 14.6  609
5.6 16.4 1305
6.0 18.3  989
6.0 21.1 1621
6.3 25.0 1367
6.5 24.9 2764
6.5 28.0 2894
6.7 28.0 2235
7.0 30.7 1410
7.2 26.7  944
7.2 33.6 1424
7.5 34.9 1777
7.6 41.3 2985];
data.LW   = LWN(:,[1 2]);
units.LW  = {'cm', 'g'};  label.LW = {'body length', 'wet weight'};  
bibkey.LW = 'Gunt1990';
%
data.LN   = LWN(:,[1 3]);
units.LN  = {'cm', '#'};  label.LN = {'body length', 'number of eggs'};  
temp.LN   = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gunt1990';
  
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
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The fertile hybrid of P. ridibundus and P. lessonae is called P. esculentus';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76CHG'; % Cat of Life
metaData.links.id_ITIS = '775190'; % ITIS
metaData.links.id_EoL = '332998'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_lessonae'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_lessonae'; % ADW
metaData.links.id_Taxo = '996607'; % Taxonomicon
metaData.links.id_WoRMS = '1035199'; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+lessonae'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pelophylax_lessonae'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_lessonae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunt1990'; type = 'Book'; bib = [ ...  
'author = {G\"{u}nther, R.}, ' ...
'year = {1990}, ' ...
'title  = {Die Wasserfr\"{o}sche Europas}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
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
bibkey = 'SochOgie2010'; type = 'Article'; bib = [ ... 
'author = {M. Socha and M. Ogielska}, ' ... 
'year = {2010}, ' ...
'title = {Age structure, size and growth rate of water frogs from central {E}uropean natural \emph{Pelophylax ridibundus}-\emph{Pelophylax esculentus} mixed populations estimated by skeletochronology}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {31}, ' ...
'pages = {239--250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelophylax_lessonae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

