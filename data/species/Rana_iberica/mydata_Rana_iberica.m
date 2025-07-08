function [data, auxData, metaData, txtData, weights] = mydata_Rana_iberica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_iberica'; 
metaData.species_en = 'Iberian frog'; 

metaData.ecoCode.climate = {'BSk', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 06 01];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 06 01]; 


%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 3*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wiki';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EsteSanc2000';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EsteSanc2000';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Wiki';
data.Lpm  = 3;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Wiki';
data.Li  = 7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 5.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'guess';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwp = 6.5;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on length-weight of Rana muscosa';
data.Wwi = 83;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Rana muscosa';
data.Wwim = 40;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'guess based on length-weight of Rana muscosa';

data.Ri  = 233/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '233 eggs per clutch of Rana muscosa, assumed: 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % time since puberty (yr), SVL (cm)
2.113	4.048
2.113	4.008
2.125	4.099
2.125	3.946
2.137	4.371
2.137	3.912
2.137	3.849
2.149	3.810
2.161	4.507
3.190	5.305
3.190	5.266
3.190	5.164
3.202	5.492
3.202	5.215
3.202	5.107
3.202	5.010
3.202	4.818
3.202	4.727
3.202	4.687
3.214	4.778
4.136	5.225
4.136	5.565
4.160	4.743
4.160	4.794
4.160	4.828
4.160	4.902
4.160	5.276
4.160	5.321
5.189	5.405
5.189	5.297
5.201	5.547
5.213	5.195
6.074	5.409
6.074	5.574];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since puberty', 'SVL', 'female'};  
temp.tL_f   = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EsteSanc2000';
comment.tL_f = 'Data for females, high elevation, temp from 1 to 17 C';
%
data.tL_m = [ ... % time since puberty (yr), SVL (cm)
1.766	4.111
1.766	4.065
1.766	4.025
1.766	3.991
1.766	3.963
1.766	3.770
1.766	3.719
1.790	3.929
1.790	3.901
1.790	3.878
1.790	3.850
1.790	3.691
1.790	3.646
1.790	3.623
1.790	3.583
1.790	3.560
1.790	3.521
2.867	4.665
2.879	4.370
2.879	4.347
2.891	4.807
3.836	4.805
3.848	5.253
3.848	4.601
4.890	4.214
4.890	4.645
4.890	4.674
4.926	4.798
8.887	4.896];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since puberty', 'SVL', 'male'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EsteSanc2000';
comment.tL_m = 'Data for males, high elevation, temp from 1 to 17 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4RDSW'; % Cat of Life
metaData.links.id_ITIS = '665335'; % ITIS
metaData.links.id_EoL = '1019689'; % Ency of Life
metaData.links.id_Wiki = 'Rana_iberica'; % Wikipedia
metaData.links.id_ADW = 'Rana_iberica'; % ADW
metaData.links.id_Taxo = '47641'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+iberica'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rana_iberica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_iberica}}';
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
bibkey = 'EsteSanc2000'; type = 'Article'; bib = [ ... 
'author = {Mariska Esteban and Borja Sanchiz}, ' ... 
'year = {2000}, ' ...
'title = {DIFFERENTIAL GROWTH AND LONGEVITY IN LOW AND HIGH ALTITUDE \emph{Rana_iberica} ({A}NURA, {R}ANIDAE)}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {10}, ' ...
'pages = {9-26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+iberica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

