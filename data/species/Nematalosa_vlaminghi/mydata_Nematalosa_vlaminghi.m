function [data, auxData, metaData, txtData, weights] = mydata_Nematalosa_vlaminghi

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Nematalosa_vlaminghi'; 
metaData.species_en = 'Perth herring'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 21];

%% set data
% zero-variate data
data.ab = 3.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16.2; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'RenjSanj2017';
  comment.Lp = 'value for Nematalosa nasus';
data.Li = 36;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'ChubPott1984';
  comment.Wwb = 'based on egg diameter of  0.95 mm for Nematalosa nasus: pi/6*0.095^3';
data.Wwi = 522; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.15, see F1';

data.Ri  = 50440/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ChubPott1984';  
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity applies to TL 28.9 cm';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.820	9.084
1.840	14.249
2.834	17.567
3.831	19.992
4.856	23.014
5.834	26.927
6.773	28.100
7.804	28.682];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChubPott1986';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00912*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '466LX'; % Cat of Life
metaData.links.id_ITIS = '161808'; % ITIS
metaData.links.id_EoL = '46562482'; % Ency of Life
metaData.links.id_Wiki = 'Nematalosa'; % Wikipedia
metaData.links.id_ADW = 'Nematalosa_vlaminghi'; % ADW
metaData.links.id_Taxo = '180946'; % Taxonomicon
metaData.links.id_WoRMS = '278458'; % WoRMS
metaData.links.id_fishbase = 'Nematalosa-vlaminghi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nematalosa}}';  
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
bibkey = 'ChubPott1986'; type = 'article'; bib = [ ...
'doi = {10.1071/mf9860105}, ' ...
'author = {Chubb, C.F. and Potter, I.C.}, ' ...
'year = {1986}, ' ...
'title = {Age, growth and condition of the {P}erth herring, \emph{Nematalosa vlaminghi} ({M}unro) ({D}orosomatinae), in the {S}wan {E}stuary, south-western {A}ustralia}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'volume = {37(1)}, ' ...
'pages = {105-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChubPott1984'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1984.tb04899.x}, ' ...
'author = {Chubb, C.F. and Potter, I.C.}, ' ...
'year = {1984}, ' ...
'title = {The reproductive biology and estuarine movements of the gizzard shad, \emph{Nematalosa vlaminghi} ({M}unro)}, ' ... 
'journal = {J . Fish Biol. }, ' ...
'volume = {25(5)}, ' ...
'pages = {527–543}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamyBen2016'; type = 'article'; bib = [ ...
'author = {V. C. Ramya and S. Benakappa and H. N. Anjanayappa and E. G. Jayaraj and S. R. Somashekara and V. Mahesh}, ' ...
'year = {2016}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF \emph{Nematalosa nasus} ({B}LOCH, 1795) OFF {M}ANGALORE {C}OAST, {K}ARNATAKA}, ' ... 
'journal = {J. Exp. Zool. India}, ' ...
'volume = {19(1)}, ' ...
'pages = {313-319}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Potamalosa-richmondia.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
