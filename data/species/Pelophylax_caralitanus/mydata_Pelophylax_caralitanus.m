function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_caralitanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_caralitanus'; 
metaData.species_en = 'Anatolian frog'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFl', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 17];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pelophylax_ridibundus';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'Eris2018';
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males';  bibkey.tpm = 'Eris2018';
  temp.tpm = C2K(16); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Pelophylax_ridibundus';

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';     bibkey.Lj  = 'gueaa'; 
  comment.Lj = 'based on Pelophylax_ridibundus';
data.Lp  = 7.5;  units.Lp  = 'cm';  label.Lp  = 'ultimate SVL for females'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Pelophylax_ridibundus';
data.Li  = 11.3; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'Eris2018';
data.Lim = 10.4; units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';   bibkey.Lim = 'Eris2018';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 2.0 mm for Pelophylax_ridibundus: pi/6*0.2^3';
data.Wwi = 97; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_ridibundus: (11.3/10.6)^3*80';
data.Wwim = 75.6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Pelophylax_ridibundus: (10.4/10.6)^3*80';

data.Ri  = 6835/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_ridibundus';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), SVL (cm)
 0	 3.352  3.352
 0	 3.025  3.352
 0	 2.821  2.821
 0	 2.616  2.616
 1	 5.188  5.188
 1	 4.984  4.984
 1	 4.902  4.902
 1	 4.738  4.738
 1	 4.166  4.166
 1	 3.880  3.880
 1	 3.757  3.757
 1	 3.716  3.716
 1	 3.675  3.675
 2	 6.615  6.615
 2	 5.675  5.675
 2	 5.511  5.511
 2	 6.288  6.288
 2	 6.124  6.124
 2	 5.307  5.307
 2	 4.898  4.898
 2	 4.898  4.898
 3	 8.124  8.012
 3	 7.633  7.690
 3 	 7.429  7.368
 3   NaN    7.153
 3   NaN    6.938
 3   NaN    6.760
 3   NaN    6.581
 3   NaN    6.330
 3   NaN    6.330
 4	 9.551  8.759
 4	 8.611  8.509
 4	 9.428  8.223
 4	 9.183  8.079
 4	 8.938  7.901
 4	 8.733  7.758
 4   NaN    7.579
 5	10.161  9.113
 5	 9.670  9.113
 5	 9.425  9.721
 5	 9.343  8.863
 5	10.324  8.576
 5   NaN    8.398
 5   NaN    7.953
 6	10.361  9.871
 6	10.239  8.971
 6	 9.748  9.094
 6   NaN    9.666
 6   NaN    9.421
 6   NaN    9.217
 6   NaN    9.217
 7	10.562 10.358
 7	10.358 10.194
 7	11.012 10.071
 7  NaN     9.867 
 7  NaN     9.663
 7  NaN     9.540
 7  NaN     9.376
 7  NaN     9.213
 8	11.131 10.027
 8	10.517  9.863
 8	10.190  9.536
 8	11.580 10.640
 8	10.926 10.436
 8  NaN    10.231
 9	11.822 10.963
 9	11.495 10.718
 9	11.168 10.555
 9  NaN    10.391
 9  NaN    10.105
10	11.982 NaN
10	11.491 NaN
10	11.368 NaN
10	11.205 NaN
10	10.919 NaN
10	12.431 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.8)  * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm    = C2K(16);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'Eris2018'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males in Lake Beysehir, Turkey, 1125 m alt';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '76CJ4'; % Cat of Life
metaData.links.id_ITIS = '1106590'; % ITIS
metaData.links.id_EoL = '7245868'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_caralitanus'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_caralitanus'; % ADW
metaData.links.id_Taxo = '996597'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+caralitanus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_caralitanus}}';
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
bibkey = 'Eris2018'; type = 'Article'; bib = [ ... 
'author = {Ugur Cengiz Erismis}, ' ... 
'year = {2018}, ' ...
'title = {Age, Size, and Growth of the {T}urkish Endemic Frog \emph{Pelophylax caralitanus} ({A}nura: {R}anidae)}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {301}, ' ...
'pages = {1224–1234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pelophylax+caralitanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
