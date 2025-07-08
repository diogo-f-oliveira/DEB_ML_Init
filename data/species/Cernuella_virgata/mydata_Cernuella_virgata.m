function [data, auxData, metaData, txtData, weights] = mydata_Cernuella_virgata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Hygromiidae';
metaData.species    = 'Cernuella_virgata'; 
metaData.species_en = 'Vineyard snail'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 09]; 

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'tijd';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15 till 20 d, but temp is unkown';
data.tp = 200;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ipm';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'inspection gives 2 yr for natural populations';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ipm';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 1.5 mm egg diameter: 4/3 * pi * 0.075^3';

data.Ri  = 60*40/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'idtools';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '60 eggs/clutch, 40 clutches/yr';
 
% uni-variate data

data.tW = [ ... % time since birth (yr), wet weight^(1/3) (g)
0.099	0.277
0.135	0.334
0.164	0.376
0.197	0.406
0.199	0.437
0.225	0.518
0.233	0.487
0.262	0.569
0.262	0.579
0.290	0.634
0.291	0.625
0.295	0.591
0.301	0.621
0.323	0.678
0.328	0.723
0.331	0.642
0.359	0.675
0.359	0.734
0.390	0.707
0.390	0.726
0.393	0.751
0.424	0.792
0.428	0.727
0.444	0.805
0.492	0.826
0.514	0.858
0.552	0.777
0.583	0.828
0.591	0.875
0.614	0.879
0.638	0.872
0.644	0.867
0.672	0.842
0.688	0.923
0.704	0.900
0.767	0.870
0.790	0.894];
data.tW(:,2) = data.tW(:,2).^3; % remove transformation
units.tW   = {'yr', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Pome1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism, but no self fertilization';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This species is hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SZMC'; % Cat of Life
metaData.links.id_ITIS = '567346'; % ITIS
metaData.links.id_EoL = '592444'; % Ency of Life
metaData.links.id_Wiki = 'Cernuella_virgata'; % Wikipedia
metaData.links.id_ADW = 'Cernuella_virgata'; % ADW
metaData.links.id_Taxo = '308419'; % Taxonomicon
metaData.links.id_WoRMS = '426375'; % WoRMS
metaData.links.id_molluscabase = '426375'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cernuella_virgata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'idtools'; type = 'Misc'; bib = ...
'howpublished = {\url{http://idtools.org/id/mollusc/factsheet.php?name=Cernuella spp.}}';
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
bibkey = 'Pome1969'; type = 'Article'; bib = [ ... 
'author = {Pomeroy, D. E.}, ' ... 
'year = {1969}, ' ...
'title = {Some aspects of the ecology of the land snail, \emph{Helicella virgata}, in {S}outh {A}ustralia}, ' ...
'journal = {Austr. J. Zool.}, ' ...
'volume = {17}, ' ...
'pages = {495--514}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'tijd'; type = 'Misc'; bib = ...
'howpublished = {\url{http://natuurtijdschriften.nl/search?identifier=596524}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ipm'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ipm.msu.edu/uploads/files/Forecasting_invasion_risks/vineyardSnail.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];