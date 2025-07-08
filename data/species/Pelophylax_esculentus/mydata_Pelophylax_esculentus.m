function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_esculentus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_esculentus'; 
metaData.species_en = 'Edible frog'; 

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
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

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
data.tj = 120;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Gunt1990';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'SochOgie2010';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;units.tpm = 'd';   label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'SochOgie2010';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'SochOgie2010';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.89; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Gunt1990';  
data.Ljb = 6.5;  units.Ljb  = 'cm'; label.Ljb  = 'total length of tadpole at metam'; bibkey.Ljb  = 'Gunt1990'; 
data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 5.8;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Gunt1990';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 9.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Gunt1990';
data.Lim = 8.4;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';           bibkey.Lim  = 'SochOgie2010';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.23^3';
data.Wwj = 0.7;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 20;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 87.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gunt1990';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.065	3.209
1.066	3.896
2.057	6.149
3.058	7.090
4.071	7.642
5.072	7.955
7.054	7.970];
data.tL_f(:,1) = (data.tL_f(:,1) + .5) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SochOgie2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.215	3.164
1.206	3.851
2.208	6.179
3.209	6.358
4.200	6.970
5.212	7.104
6.203	7.746];
data.tL_m(:,1) = (data.tL_m(:,1) + .5) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SochOgie2010';
comment.tL_m = 'Data for males';

% length-weight-fecundity
LWN = [ ... % body length (cm), wet weight (g), number of eggs (#)
7.5 50.0  2944 
7.8 51.2  4889
7.8 52.8  4389
8.0 54.4  2889
8.0 57.9  5722
8.1 57.8  4833
8.5 65.6  6055
8.6 62.8  5638
8.8 71.6  3982
8.8 71.3  7333
8.9 80.5  7388
9.2 77.6 10021
9.2 83.0  8166
9.5 87.5  7444];
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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'The fertile hybrid of P. ridibundus and P. lessonae is called P. esculentus; mostly diploid, but also triploid';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1018660'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_esculentus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_esculentus'; % ADW
metaData.links.id_Taxo = '1683418'; % Taxonomicon
metaData.links.id_WoRMS = '993382'; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+esculentus'; % Amphibiaweb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_esculentus}}';
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

