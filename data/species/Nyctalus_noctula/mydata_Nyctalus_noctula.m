function [data, auxData, metaData, txtData, weights] = mydata_Nyctalus_noctula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Nyctalus_noctula'; 
metaData.species_en = 'Common noctule'; 

metaData.ecoCode.climate = {'Cfa', 'Cwc', 'Df'};
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
data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Klei1969';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;    units.tp = 'd';    label.tp = 'age at puberty for female';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span, guessed';      bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Klei1969';
data.Wwx = 19; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'Klei1969';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Klei1969';
  comment.Wwi = '25 to 30 g';

data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 1.5 pups per litters'; 

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.934	5.802
3.914	6.792
6.001	8.110
7.760	8.990
9.737	10.308
11.716	11.352
13.906	13.382
15.887	14.262
17.867	15.197
19.734	16.460
21.716	17.122
23.587	17.893
26.017	18.009
27.782	18.342
29.767	18.730
31.532	19.117
33.521	19.123
35.837	19.512
37.941	19.080
39.926	19.523
41.805	19.419
43.792	19.588
45.775	20.305
47.870	20.693
49.961	21.629
51.947	21.962
54.038	22.788
55.804	23.012
58.009	23.565
60.196	25.977];
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
metaData.links.id_CoL = '484XC'; % Cat of Life
metaData.links.id_ITIS = '632069'; % ITIS
metaData.links.id_EoL = '1038529'; % Ency of Life
metaData.links.id_Wiki = 'Nyctalus_noctula'; % Wikipedia
metaData.links.id_ADW = 'Nyctalus_noctula'; % ADW
metaData.links.id_Taxo = '64834'; % Taxonomicon
metaData.links.id_WoRMS = '1037283'; % WoRMS
metaData.links.id_MSW3 = '13802038'; % MSW3
metaData.links.id_AnAge = 'Nyctalus_noctula'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nyctalus_noctula}}'];
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nyctalus_noctula}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [...
'howpublished = {\url{http://eol.org/pages/1038529/overview}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

