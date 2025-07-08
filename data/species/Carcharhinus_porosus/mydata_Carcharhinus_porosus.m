function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_porosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_porosus'; 
metaData.species_en = 'Smalltail shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 24];


%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Wiki';   
  temp.ab = C2K(25.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'about a yr';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'LessSant1998';   
  temp.am = C2K(25.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 32;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '31-40 cm';
data.Lp  = 70;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'Wiki';

data.Wwi = 6.9e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00324*Li^3.10, see F1';

data.Ri  = 5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 32.8
    1 40.4
    2 47.0
    3 55.1
    4 64.4
    5 69.6
    6 74.4
    7 79.9
    8 83.5
    9 87.1
   10 90.8
   11 92.2
   12 99.1];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'LessSant1998';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00324 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5WZKL'; % Cat of Life
metaData.links.id_ITIS = '160340'; % ITIS
metaData.links.id_EoL = '46559797'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_porosus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_porosus'; % ADW
metaData.links.id_Taxo = '106452'; % Taxonomicon
metaData.links.id_WoRMS = '217342'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-porosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_porosus}}';
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
bibkey = 'LessSant1998'; type = 'Article'; bib = [ ... 
'author = {Rosangela Lessa and Francisco Marcante Santana}, ' ... 
'year = {1998}, ' ...
'title = {Age determination and growth of the smalltail shark, \emph{Carcharhinus porosus}, from northern {B}razil}, ' ...
'journal = {Marine Freshwater Research}, ' ...
'volume = {49}, ' ...
'pages = {705-711}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-porosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

