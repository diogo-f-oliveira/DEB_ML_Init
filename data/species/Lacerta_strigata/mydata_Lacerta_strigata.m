function [data, auxData, metaData, txtData, weights] = mydata_Lacerta_strigata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Lacerta_strigata'; 
metaData.species_en = 'Caucusus Emerald Lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 100;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'EngeFrit1993';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7 till 10 weeks';
data.ap = 24*30.5;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'RoitSmir2006';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7.5*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'RoitSmir2006';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'RoitSmir2006';  
data.Li  = 11;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'RoitSmir2006';  

data.Wwi = 29.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'HallGrie2015';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EngeFrit1993';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 11 twice per year';

% univariate data
% time-length
data.tL_fKo = [ ... % time since birth (yr), SVL (cm)
1	3.912
1	4.219
1	4.417
1	4.526
1	4.743
1	4.995
1	5.068
1	5.068
1	5.284
1	5.483
1	5.718
1	5.862
2	7.640
2	7.712
2	7.784
2	7.947
2	9.066
2	9.211
2	6.917
2	7.134
2	7.278
2	8.290
2	8.344
2	8.543
3	8.749
3	9.236
3	8.478
3	8.641
3	9.020
3	9.110
4	9.714
4	9.244
4	9.118];
data.tL_fKo(:,1) = (data.tL_fKo(:,1)-.7) * 365; % convert yr to d
units.tL_fKo  = {'d', 'cm'};  label.tL_fKo = {'time since birth', 'SVL', 'female'};  
temp.tL_fKo   = C2K(24);  units.temp.tL_fKo = 'K'; label.temp.tL_fKo = 'temperature';
bibkey.tL_fKo = 'RoitSmir2006';
comment.tL_fKo = 'Data for females in Kostek, 50 m';
%
data.tL_mKo = [ ... % time since birth (yr), SVL (cm)
1	4.704
1	4.541
1	5.354
1	3.837
1	3.982
1	4.993
1	5.065
1	5.119
1	5.860
1	4.885
1	5.517
1	5.553
1	4.397
1	4.776
2	8.667
2	8.739
2	8.901
2	9.046
2	9.172
2	9.299
2	6.464
2	7.962
2	8.306
2	8.432
2	7.023
2	7.240
2	7.349
3	8.999
3	9.126
3	9.270
3	9.830
3	8.006
3	9.541
4	9.928
5	10.098];
data.tL_mKo(:,1) = (data.tL_mKo(:,1)-.7) * 365; % convert yr to d
n=size(data.tL_mKo,1); for i=2:n; if data.tL_mKo(i,1)<=data.tL_mKo(i-1,1); data.tL_mKo(i,1)=data.tL_mKo(i-1,1)+1e-3; end; end
units.tL_mKo  = {'d', 'cm'};  label.tL_mKo = {'time since birth', 'SVL', 'male'};  
temp.tL_mKo   = C2K(24);  units.temp.tL_mKo = 'K'; label.temp.tL_mKo = 'temperature';
bibkey.tL_mKo = 'RoitSmir2006';
comment.tL_mKo = 'Data for males in Kostek, 50 m';
%
data.tL_fSe = [ ... % time since birth (yr), SVL (cm)
1	4.489
1	3.897
1	4.004
1	4.399
2	7.269
2	7.843
2	7.951
2	8.094
2	7.574
3	8.758
3	8.614
4	9.206];
data.tL_fSe(:,1) = (data.tL_fSe(:,1)-.7) * 365; % convert yr to d
units.tL_fSe  = {'d', 'cm'};  label.tL_fSe = {'time since birth', 'SVL', 'female'};  
temp.tL_fSe   = C2K(22);  units.temp.tL_fSe = 'K'; label.temp.tL_fSe = 'temperature';
bibkey.tL_fSe = 'RoitSmir2006';
comment.tL_fSe = 'Data for females in Sergokala, 600 m';
%
data.tL_mSe = [ ... % time since birth (yr), SVL (cm)
1	3.717
1	3.753
1	4.148
1	4.309
1	5.045
2	7.484
2	6.839
2	7.161
2	7.664
2	7.269
2	7.305
2	7.377
2	7.987
2	8.471
3	8.722
3   8.812
3	8.919
3	8.578
3	8.650
3	9.475
3	9.206
4	9.547
4	9.206
4	9.350
5	9.637];
data.tL_mSe(:,1) = (data.tL_mSe(:,1)-.7) * 365; % convert yr to d
n=size(data.tL_mSe,1); for i=2:n; if data.tL_mSe(i,1)<=data.tL_mSe(i-1,1); data.tL_mSe(i,1)=data.tL_mSe(i-1,1)+1e-3; end; end
units.tL_mSe  = {'d', 'cm'};  label.tL_mSe = {'time since birth', 'SVL', 'male'};  
temp.tL_mSe   = C2K(22);  units.temp.tL_mSe = 'K'; label.temp.tL_mSe = 'temperature';
bibkey.tL_mSe = 'RoitSmir2006';
comment.tL_mSe = 'Data for males in Sergokala, 600 m';
%
data.tL_fKh = [ ... % time since birth (yr), SVL (cm)
1	3.543
1	3.435
1	4.210
1	4.282
1	4.408
1	4.102
2	8.591
2	7.582
2	6.970
2	7.060
2	7.168
2	7.258
2	7.870
2	7.942
3	8.810
3	8.918
3	8.143
3	8.215
3	8.305
3	8.540
3	7.513
4	9.371
4	8.849
4	9.083
5	9.626
5	9.103];
data.tL_fKh(:,1) = (data.tL_fKh(:,1)-.7) * 365; % convert yr to d
units.tL_fKh  = {'d', 'cm'};  label.tL_fKh = {'time since birth', 'SVL', 'female'};  
temp.tL_fKh   = C2K(22);  units.temp.tL_fKh = 'K'; label.temp.tL_fKh = 'temperature';
bibkey.tL_fKh = 'RoitSmir2006';
comment.tL_fKh = 'Data for females in Khuchni, 600 m';
%
data.tL_mKh = [ ... % time since birth (yr), SVL (cm)
1	4.930
1	4.119
1	3.669
1	3.831
1	4.191
1	4.318
1	4.534
2	7.996
2	7.041
2	7.653
2	7.798
2	7.852
2	7.942
2	8.302
2	8.374
2	6.825
2	7.131
2	7.203
2	7.275
2	7.347
2	7.383
2	7.473
3	8.160
3	8.233
3	9.206
3	9.025
3	8.521
4	9.532];
data.tL_mKh(:,1) = (data.tL_mKh(:,1)-.7) * 365; % convert yr to d
n=size(data.tL_mKh,1); for i=2:n; if data.tL_mKh(i,1)<=data.tL_mKh(i-1,1); data.tL_mKh(i,1)=data.tL_mKh(i-1,1)+1e-3; end; end
units.tL_mKh  = {'d', 'cm'};  label.tL_mKh = {'time since birth', 'SVL', 'male'};  
temp.tL_mKh   = C2K(22);  units.temp.tL_mKh = 'K'; label.temp.tL_mKh = 'temperature';
bibkey.tL_mKh = 'RoitSmir2006';
comment.tL_mKh = 'Data for males in Khuchni, 600 m';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 50 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fKo','tL_mKo'}; subtitle1 = {'Data for females, males at Kostek, 50 m'};
set2 = {'tL_fSe','tL_mSe'}; subtitle2 = {'Data for females, males at Sergokala, 600 m'};
set3 = {'tL_fKh','tL_mKh'}; subtitle3 = {'Data for females, males at Khuchni, 600 m'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3RMWM'; % Cat of Life
metaData.links.id_ITIS = '1155289'; % ITIS
metaData.links.id_EoL = '792774'; % Ency of Life
metaData.links.id_Wiki = 'Lacerta_strigata'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_strigata'; % ADW
metaData.links.id_Taxo = '49578'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Lacerta&species=strigata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lacerta_strigata}}';
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
bibkey = 'RoitSmir2006'; type = 'Article'; bib = [ ... 
'author = {E. S. Roitberg and E. M. Smirina}, ' ... 
'year = {2006}, ' ...
'title = {AGE, BODY SIZE AND GROWTH OF \emph{Lacerta agilis boemica} AND \emph{L. strigata}: A COMPARATIVE STUDY OF TWO CLOSELY RELATED LIZARD SPECIES BASED ON SKELETOCHRONOLOGY}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {16}, ' ...
'pages = {133-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EngeFrit1993'; type = 'Book'; bib = [ ... 
 'title = {Lurche und Kriechtiere Europas}, ' ...
 'publisher = {Neumann Verlag}, ' ...
 'year = {1993}, ' ...
 'author = {Engelmann, W.-E. and Fritzsche, J. and G\"{u}nther, R. and Obst, F. J.}, ' ...
 'address = {Radebeul}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HallGrie2015'; type = 'Article'; bib = [ ... 
'author = {K. Hallmann and E. M. Griebeler}, ' ... 
'year = {2015}, ' ...
'doi = {10.1371/journal.pone.0138785}, ' ...
'title = {Eggshell Types and Their Evolutionary Correlation with Life-History Strategies in Squamates}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {10(9)}, ' ...
'pages = {e0138785}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

