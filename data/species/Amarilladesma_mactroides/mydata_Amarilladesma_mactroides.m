function [data, auxData, metaData, txtData, weights] = mydata_Amarilladesma_mactroides

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Venerida';
metaData.family     = 'Mactridae';
metaData.species    = 'Amarilladesma_mactroides';
metaData.species_en = 'Yellow clam';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17);
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.3;

metaData.author    = {'Bas Kooijman'};
metaData.date_subm = [2019 05 05];
metaData.email     = {'bas.kooijman@vu.nl'};
metaData.address   = {'VU University Amsterdam'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 05 05]; 

%% Set zero-variate data;
data.am   = 365 * 6; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'guess';
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;      units.Lp = 'cm'; label.Lp = 'shell length at puberty';       bibkey.Lp = 'guess';
data.Li = 8.5;   units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'HerrAlfa2011';

data.Wwb = 4.2e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';
data.Wwi = 11.6; units.Wwi = 'g'; label.Wwi = 'ultimate wet tissue weight'; bibkey.Wwi = {'FiorFron2019','HerrAlfa2011'};
  comment.Wwi = 'based on 5.75e-5*(Li*10)^2.75, see F1';

data.Ri    = 3e3;   units.Ri      = '#/d'; label.Ri      = 'maximum reprod rate'; bibkey.Ri = 'guess';
  temp.Ri  = C2K(17); units.temp.Ri = 'K';   label.temp.Ri = 'temperature';
comment.Ri = 'based on kap = 0.6';

%% Set uni-variate data
% time-length
data.tL = [ ...  % time (d),  hell length (cm)
151.804	1.033
195.969	1.486
245.991	1.550
299.856	1.636
363.238	2.218
413.168	2.713
463.078	3.294
507.322	3.380
553.439	3.703
749.533	4.629
899.519	5.189
976.367	5.792
1076.35 6.201];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'shell length'};
temp.tL = C2K(17); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HerrAlfa2011';
comment.tL = 'Data from length frequencies'; 

%% Set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 5.75e-5*(shell length in mm)^2.75';
metaData.bibkey.F1 = 'FiorFron2019'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CH9Z'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46472135'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3940349'; % Taxonomicon
metaData.links.id_WoRMS = '505790'; % WoRMS
metaData.links.id_molluscabase = '505790'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mesodesma}},'...
'note = {Accessed : 2015-04-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HerrAlfa2011'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10152-010-0222-3}, ' ...
'author = {Marko Herrmann and Jos\''{e}e E. F. Alfaya  and Mauro L. Lepore and Pablo E. Penchaszadeh and Wolf E. Arntz}, ' ...
'year = {2011}, ' ...
'title = {Population structure, growth and production of the yellow clam \emph{Mesodesma mactroides} ({B}ivalvia: {M}esodesmatidae) from a high-energy, temperate beach in northern Argentina}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {65}, ' ...
'pages = {285-297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FiorFron2019'; type = 'Article'; bib = [ ...
'doi = {10.1080/15564894.2018.1521482}, ' ...
'author = {Sandra Fiori and Romina Frontini and Cristina Bay\''{o}n}, ' ...
'year = {2019}, ' ...
'title = {Morphometric Analysis of the Yellow Clam (\emph{Amarilladesma Mactroides}) to Interpret Fragmentary Archaeological Specimens}, ' ...
'journal = {The Journal of Island and Coastal Archaeology}, ' ...
'volume = {0}, ' ...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


