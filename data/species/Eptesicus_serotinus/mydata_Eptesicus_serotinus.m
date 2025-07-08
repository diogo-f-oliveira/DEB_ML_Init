function [data, auxData, metaData, txtData, weights] = mydata_Eptesicus_serotinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Eptesicus_serotinus'; 
metaData.species_en = 'Serotine bat'; 

metaData.ecoCode.climate = {'B', 'Cfa', 'Df'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 11 01];              

%% set data
% zero-variate data
data.tg = 68;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;    units.tx = 'd';    label.tx = 'gestation time';               bibkey.tx = 'Klei1969';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 547;    units.tp = 'd';    label.tp = 'time since birth at weaning'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Value for E. fuscus';
data.am = 21*365;    units.am = 'd';    label.am = 'life span, guessed';       bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Klei1969';
data.Wwx = 14.8; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'Klei1969';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Klei1969';
  comment.Wwi = '20 to 30 g';

data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 1 to 2 pups per litters'; 

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.836	5.744
4.019	6.735
6.203	7.677
7.785	8.910
9.767	10.047
12.048	11.186
13.931	12.225
16.014	13.215
17.902	13.862
19.893	14.019
21.684	14.420
23.873	14.724
25.961	15.274
27.951	15.627
29.841	15.979
32.031	16.235
33.822	16.538
35.911	16.891
37.899	17.440
39.891	17.597
41.881	17.950
43.871	18.303
45.956	19.048
47.942	19.842
50.029	20.441
52.015	21.186
56.269	24.393
57.963	24.401];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Klei1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'diapause (at start of gestation)';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7TKLW'; % Cat of Life
metaData.links.id_ITIS = '631969'; % ITIS
metaData.links.id_EoL = '327660'; % Ency of Life
metaData.links.id_Wiki = 'Eptesicus_serotinus'; % Wikipedia
metaData.links.id_ADW = 'Eptesicus_serotinus'; % ADW
metaData.links.id_Taxo = '168026'; % Taxonomicon
metaData.links.id_WoRMS = '1037281'; % WoRMS
metaData.links.id_MSW3 = '13801865'; % Mammal Spec World
metaData.links.id_AnAge = 'Eptesicus_serotinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Eptesicus_serotinus}}'];
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
bibkey = 'Klei1969'; type = 'Article'; bib = [ ... 
'author = {D. G. Kleiman}, ' ...
'title = {Maternal care, growth rate, and development in the noctule (\emph{Nyctalus noctula}), pipistrelle (\emph{Pipistrellus pipistrellus}), and serotine (\emph{Eptesicus serotinus}) bats}, ' ...
'journal = {J. Zool., Lond.}, ', ...
'year = {1969}, ' ...
'volume = {157}, ', ...
'pages = {187-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eptesicus_serotinus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{http://eol.org/pages/327660/overview}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

