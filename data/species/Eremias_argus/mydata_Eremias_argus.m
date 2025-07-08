function [data, auxData, metaData, txtData, weights] = mydata_Eremias_argus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Eremias_argus'; 
metaData.species_en = 'Mongolia racerunner'; 

metaData.ecoCode.climate = {'Cwa','Cfa','Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 12];              
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

data.ab = 50;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KimSong2010';   
  temp.ab = C2K(28);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KimSong2010';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'KimSong2010';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.66;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'KimSong2010'; 
data.Lp  = 3.9;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'KimSong2010'; 
  comment.Lp = 'based on tp and tL data';
data.Li  = 6.58;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'KimSong2010';
data.Lim  = 6.37;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'KimSong2010';

data.Wwb = 0.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'KimSong2010';
data.Wwi = 6.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'KimSong2010';
data.Wwim = 7.0; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'KimSong2010';
 
data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Eremias_multiocellata';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0	2.695
0	2.842
0	2.990
0	2.458
0	2.532
0	2.606
2	5.798
2	3.552
2	3.847
2	3.966
2	4.512
2	3.241
2	4.246
3	6.153
3	4.039
3	4.172
3	4.261
3	4.438
3	4.542
3	4.867
3	4.970
3	5.251
3	5.325
3	5.961
4	5.236
4	5.296
4	5.384
4	5.562
5	6.419
5	5.473
5	5.148
6	5.473
6	5.576
6	5.709
6	6.167
8	6.345];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KimSong2010'; comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (#), SVL (cm)
2	3.729
2	4.128
2	4.394
3	4.764
4	5.709
4	5.133
4	4.232
5	5.857
5	5.916
5	4.941
5	6.123
6	6.389
7	5.946
7	6.448
8	6.448
9	6.596
9	6.315
10	7.512
11	5.946];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KimSong2010'; comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lp = 10 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6GDVC'; % Cat of Life
metaData.links.id_ITIS = '1155237'; % ITIS
metaData.links.id_EoL = '1056348'; % Ency of Life
metaData.links.id_Wiki = 'Eremias_argus'; % Wikipedia
metaData.links.id_ADW = 'Eremias_argus'; % ADW
metaData.links.id_Taxo = '642546'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eremias&species=argus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eremias_argus}}';
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
bibkey = 'KimSong2010'; type = 'Article'; bib = [ ... 
'doi = {10.5141/JEFB.2010.33.4.325}, ' ...
'author = {Ja-Kyoung Kim and Jae-Young Song and Jung-Hyun Lee and Daesik Park}, ' ... 
'year = {2010}, ' ...
'title = {Physical characteristics and age structure of {M}ongolian racerunner (\emph{Eremias argus}; {L}arcertidae; {R}eptilia)}, ' ...
'journal = {J. Ecol. Field Biol.}, ' ...
'volume = {33(4)}, ' ...
'pages = {325-331}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

