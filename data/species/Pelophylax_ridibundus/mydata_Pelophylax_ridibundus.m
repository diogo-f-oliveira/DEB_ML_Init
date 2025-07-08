function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_ridibundus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_ridibundus'; 
metaData.species_en = 'Marsh frog'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dsa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg', 'jiTa', 'jiTs'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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
data.tj = 120;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'Gunt1990';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'SochOgie2010';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'SochOgie2010';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.89; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Gunt1990';  
data.Ljb = 10.0; units.Ljb  = 'cm'; label.Ljb  = 'total length of tadpole at metam';   bibkey.Ljb  = 'Gunt1990'; 
  comment.Ljb = 'amphibiaweb gives 18.6 cm';
data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 7.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Gunt1990';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 10.6; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SochOgie2010';
  comment.Li = 'Wiki gives 17 cm';
data.Lim = 9;    units.Lim  = 'cm'; label.Lim = 'ultimate SVL';            bibkey.Lim  = 'SochOgie2010';
  comment.Lim = 'Wiki gives 12 cm';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.2^3';
data.Wwj = 0.46; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 28;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 80;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Gunt1990';

data.Ri  = 6835/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
temp.Ri  = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
-0.248	2.881
0.765	4.119
1.766	6.313
2.757	6.896
3.748	8.224
4.771	8.313
5.772	8.746
6.763	9.776];
data.tL_f(:,1) = (data.tL_f(:,1)+.5)  * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SochOgie2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
-0.086	2.821
0.905	4.000
1.917	6.567
2.908	6.925
3.898	7.537
4.911	7.597
5.912	7.821];
data.tL_m(:,1) = (data.tL_m(:,1)+.5) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SochOgie2010';
comment.tL_m = 'Data for males';

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
F1 = 'The average size of yearlings that had completed their metamorphosis from overwintered tadpoles is significantly larger than the size of yearlings from tadpoles of the current year that completed their metamorphosis';
metaData.bibkey.F1 = 'Ivan2017'; 
F2 = 'The fertile hybrid of P. ridibundus and P. lessonae is called P. esculentus';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '76CHR'; % Cat of Life
metaData.links.id_ITIS = '775195'; % ITIS
metaData.links.id_EoL = '320013'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_ridibundus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_ridibundus'; % ADW
metaData.links.id_Taxo = '996613'; % Taxonomicon
metaData.links.id_WoRMS = '1526205'; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+ridibundus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pelophylax_ridibundus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_ridibundus}}';
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
bibkey = 'Ivan2017'; type = 'Article'; bib = [ ... 
'author = {N. L. Ivanova}, ' ... 
'year = {2017}, ' ...
'title = {Growth Characteristics and Rates of the Mash Frog \emph{Pelophylax ridibundus} {P}all. {I}ntroduced into Water Bodies of the {M}iddle {U}rals}, ' ...
'journal = {Biology Bulletin}, ' ...
'volume = {44}, ' ...
'pages = {412-416}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Pelophylax&where-species=ridibundus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelophylax_ridibundus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
