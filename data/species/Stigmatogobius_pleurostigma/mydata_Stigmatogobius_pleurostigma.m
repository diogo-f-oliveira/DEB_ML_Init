function [data, auxData, metaData, txtData, weights] = mydata_Stigmatogobius_pleurostigma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Stigmatogobius_pleurostigma'; 
metaData.species_en = 'Knight Goby'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 7;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(17.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'guess';   
  temp.am = C2K(17.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.1;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 6.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.5 mm: pi/6*0.05^3';
data.Wwp = 0.71;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.04, see F1';
data.Wwi = 2.76; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.04, see F1';

data.Ri = 5650/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), total length (cm)
0.829	3.798
1.183	4.100
1.351	4.800
1.422	5.016
1.565	5.200
1.593	5.284
1.662	5.583]; 
data.tL(:,1) = 365 * (.0 + data.tL(:,1)); 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(17.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DinhNguy2018';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52L8Q'; % Cat of Life
metaData.links.id_ITIS = '638079'; % ITIS
metaData.links.id_EoL = '46576496'; % Ency of Life
metaData.links.id_Wiki = 'Stigmatogobius_pleurostigma'; % Wikipedia
metaData.links.id_ADW = 'Stigmatogobius_pleurostigma'; % ADW
metaData.links.id_Taxo = '188253'; % Taxonomicon
metaData.links.id_WoRMS = '278616'; % WoRMS
metaData.links.id_fishbase = 'Stigmatogobius-pleurostigma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zosterisessor_ophiocephalus}}';
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
bibkey = 'DinhNguy2018'; type = 'Article'; bib = [ ... 
'author = {Quang Minh Dinh and Nguyen Phuong Dai Nguyen}, ' ... 
'year = {2018}, ' ...
'title = {Population and age structure of the goby \emph{Stigmatogobius pleurostigma} ({P}erciformes: {G}obiidae) from the {M}ekong {D}elta}, ' ...
'journal = {International Journal of Aquatic Science}, ' ...
'volume = {9(1)}, ' ...
'pages = {23-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Zosterisessor-ophiocephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

