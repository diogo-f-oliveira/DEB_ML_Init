function [data, auxData, metaData, txtData, weights] = mydata_Scoliodon_laticaudus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Scoliodon_laticaudus'; 
metaData.species_en = 'Spadenose shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 01];


%% set data
% zero-variate data

data.ab = 4*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(28.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 14;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
data.Lp  = 33;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 12.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00427*Lb^3.03, see F3';
data.Wwp = 170;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.03, see F3';
data.Wwi = 4.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.03, see F3';
 
data.Ri  = 14/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase: 2 till 14 pups per litter, one litter per yr';

% uni-variate data
 
% time-length data 
data.tL = [ ... % time since birth (yr), total length (cm)
    0 14
    1 26
    2 38
    3 47
    4 53
    5 59];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Nair1976';
comment.tL = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'viviparous with an unusual columnar placenta )';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 28 C, usually 7 - 100 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00427*(TL in cm)^3.03';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '4VRW9'; % Cat of Life
metaData.links.id_ITIS = '160491'; % ITIS
metaData.links.id_EoL = '46559828'; % Ency of Life
metaData.links.id_Wiki = 'Scoliodon_laticaudus'; % Wikipedia
metaData.links.id_ADW = 'Scoliodon_laticaudus'; % ADW
metaData.links.id_Taxo = '106464'; % Taxonomicon
metaData.links.id_WoRMS = '217364'; % WoRMS
metaData.links.id_fishbase = 'Scoliodon-laticaudus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scoliodon_laticaudus}}';
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
bibkey = 'Nair1976'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF12140}, ' ...
'author = {K. Phakaran Nair}, ' ... 
'year = {1976}, ' ...
'title = {AGE AND GROWTH OF THE YELLOW DOG SHARK \emph{Scoliodon laticaudus}{M}ULLER AND {H}ENLE FROM {B}OMBAY WATERS}, ' ...
'journal = {Mar, Biol. Ass. India}, ' ...
'volume = {18(3)}, ' ...
'pages = {531-539}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scoliodon-laticaudus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

