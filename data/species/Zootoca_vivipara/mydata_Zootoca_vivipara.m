function [data, auxData, metaData, txtData, weights] = mydata_Zootoca_vivipara 

%% set metaData % see http://www.debtheory.org/wiki/index.php?title=Mydata_file for metaData field descriptions

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Zootoca_vivipara'; 
metaData.species_en = 'Common lizard'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.7); % K, typical body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';'Wwp';'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L'; 't-Ww'; 'T-JO'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Andreaz Dupoue'};    
metaData.date_subm = [2020 11 17];              
metaData.email    = {'andreaz.dupoue@gmail.com'};            
metaData.address  = {'Sorbonne University, Institute of Ecological and Environmental Sciences, 4 place Jussieu, 75005, Paris, France'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 20]; 

%% set data
% zero-variate data;

% age 0 is at onset of embryo development
data.ab = 45;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Dupo2018';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '29 C for 9h, 17 C for 15 h'; 
data.ap = 14*30+45;      units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'Dupo2018';   
  temp.ap = C2K(13.7);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ab  = 'temperature estimated on NicheMapR'; 
data.am = 6*365+45;      units.am = 'd';    label.am = 'lifespan';  bibkey.am = 'Dupo2018';   
  temp.am = C2K(13.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am  = 'temperature estimated on NicheMapR'; 

data.Lb = 2.1;    units.Lb = 'cm';    label.Lb = 'SVL at hatching';  bibkey.Lb = 'Dupo2018';    
data.Lp = 5;      units.Lp = 'cm';    label.Lp = 'SVL at puberty';  bibkey.Lp = 'Dupo2018';   
data.Li = 7;      units.Li = 'cm';    label.Li = 'ultimate SVL';  bibkey.Li = 'Dupo2018';   

data.Wwb = 0.19;     units.Wwb = 'g';    label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Dupo2018';   
data.Wwp = 2.2;      units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Dupo2018';   
data.Wwi = 5;        units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'Dupo2018';   

data.Ri = 14/365;      units.Ri = '#/d';    label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Dupo2018';   
  temp.Ri = C2K(13.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'maximal observed reproductive investment'; 

% uni-variate data 
OTW = csvread('OTW.csv');
data.TO = cat(2,OTW(:,2),OTW(:,1));
units.TO = {'C','ml O2/min'}; label.TO = {'temperature','O2 consumption rate'};  bibkey.TO = 'Lepe2007';

% uni-variate growth data 
tLW = csvread('tLW_zootoca.csv');
tLW = sortrows(tLW,1);

data.tW = cat(2,tLW(:,1),tLW(:,3));
units.tW = {'d', 'g'};  label.tW = {'age', 'weight'};  bibkey.tW = 'Dupo2018';
temp.tW = C2K(13.7); units.temp.tW = 'K'; label.temp.tW = 'temperature';

data.tL = cat(2,tLW(:,1),tLW(:,2));
units.tL = {'d', 'cm'};  label.tL = {'age', 'length'};  bibkey.tL = 'Dupo2018';

data.LW = cat(2,tLW(:,2),tLW(:,3));
units.LW = {'cm', 'g'}; label.LW = {'snout vent length', 'wet weight'};  bibkey.LW = 'Dupo2018';

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
set1 = {'TO'}; subtitle1 = {'Standard metabolic rate'};
set2 = {'tW'}; subtitle2 = {'weight against time'};
set3 = {'tL'}; subtitle3 = {'size against time'};
set4 = {'LW'}; subtitle4 = {'weight against size'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'O2 consumption rate was measured in 2007 by Virginie Lepetz but it is not published';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5D7Q2'; % Cat of Life
metaData.links.id_ITIS = '1155342'; % ITIS
metaData.links.id_EoL = '47045448'; % Ency of Life
metaData.links.id_Wiki = 'Zootoca_vivipara'; % Wikipedia
metaData.links.id_ADW = 'Zootoca_vivipara'; % ADW
metaData.links.id_Taxo = '1678426'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Zootoca&species=vivipara'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Dupo2018'; type = 'Article'; bib = [ ...  %
'author = {Dupou\''{e}, A. and Le Galliard, J.-F. and Josserand, R. and DeNardo, D. F. and Decenci\`{e}re, B. and Agostini, S. and Haussy, C and Meylan S.}, ' ...
'title = {Water restriction causes an intergenerational trade-off and delayed mother-offspring conflict in a viviparous lizard}, ' ...
'journal = {Functional Ecology}, ' ...
'year = {2018}, ' ...
'volume = {32}, ' ...
'number = {3}, ' ...
'pages = {676-686}, ' ...
'DOI = {10.1111/1365-2435.13009}'];
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
bibkey = 'Lepe2007'; type = 'Misc'; bib = ...
'howpublished = {Virginie Lepetz, 2007, unpublished communication.}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


