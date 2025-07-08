  function [data, auxData, metaData, txtData, weights] = mydata_Chrysichthys_nigrodigitatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Claroteidae';
metaData.species    = 'Chrysichthys_nigrodigitatus'; 
metaData.species_en = 'Belly up'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO','piCi','piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 07];

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'guess';
data.Li = 65;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 252.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01072*Lp^2.96, see F1';
data.Wwi = 2.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.96, see F1';
  
data.Ri  = 28086/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1	9.191
2	24.826
3	34.616];
data.tL(:,1) = (data.tL(:,1)-0.5) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IkonOgbe2015';
comment.tL = 'Data from Lake Akata';
%
data.tL1 = [ ... % time since birth (yr), total length (cm)
0   NaN   9.0 NaN
1	18.5 15.0 42.2
2	32.6 20.0 60.1
3	43.5 25.0 73.1
4   53.9 33.0 82.1
5   NaN  36.0 90.2
6   NaN  40.0 NaN];
data.tL1(:,1) = (data.tL1(:,1)+0.5) * 365; % convert yr to d
units.tL1 = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'};  
temp.tL1 = C2K(25);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
treat.tL1 = {1, {'Qua Iboe River','Cross River estuary','Nun River'}};
bibkey.tL1 = {'EkpoUdoh2013','Nawa1985'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'age estimates had to reduced with 0.5 yr to arrive at a natural fit with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YKGK'; % Cat of Life
metaData.links.id_ITIS = '680944'; % ITIS
metaData.links.id_EoL = '994739'; % Ency of Life
metaData.links.id_Wiki = 'Chrysichthys'; % Wikipedia
metaData.links.id_ADW = 'Chrysichthys_nigrodigitatus'; % ADW
metaData.links.id_Taxo = '171134'; % Taxonomicon
metaData.links.id_WoRMS = '581699'; % WoRMS
metaData.links.id_fishbase = 'Chrysichthys-nigrodigitatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Chrysichthys}}';  
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
bibkey = 'IkonOgbe2015'; type = 'Article'; bib = [ ...
'author = {Ikongbeh, O.A. and Ogbe, F.G. and Solomon, S.G. and Ataguba, G.A.}, ' ...
'year = {2015}, ' ...
'title = {Age, growth and mortality of \emph{Chrysichthyes nigrodigitatus} (Lac\''{e}p\`{e}de, 1803) from {L}ake {A}kata, {B}enue {S}tate, {N}igeria}, ' ... 
'journal = {Asian Journal of Conservation Biology}, ' ...
'volume = {4(1)}, '...
'pages = {81-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EkpoUdoh2013'; type = 'Article'; bib = [ ...
'doi = {10.5923/j.ije.20130304.02}, ' ...
'author = {Imaobong E. Ekpo and James P. Udoh}, ' ...
'year = {2013}, ' ...
'title = {Age and Growth of \emph{Chrysichthys auratus} in the {L}ower {C}ross {R}iver, {S}outheast {N}igeria}, ' ... 
'journal = {International Journal of Ecosystem}, ' ...
'volume = {3(4)}, '...
'pages = {64-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nawa1985'; type = 'article'; bib = [ ...
'author = {Nawa, I.G}, ' ...
'year = {1985}, ' ...
'title = {A study on the growth of \emph{Pseudotolithus elongatus}, \emph{Chrysichthys nigrodigitatus} and \emph{Cynoglossus goreensis} occurring in the {C}ross {R}iver {E}stuary}, ' ... 
'journal = {Aquadocs}, ' ...
'howpublished = {\url{http://hdl.handle.net/1834/21143}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrysichthys-nigrodigitatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

