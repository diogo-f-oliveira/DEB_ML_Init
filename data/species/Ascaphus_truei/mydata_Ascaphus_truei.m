function [data, auxData, metaData, txtData, weights] = mydata_Ascaphus_truei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ascaphidae';
metaData.species    = 'Ascaphus_truei'; 
metaData.species_en = 'Tailed frog'; 

metaData.ecoCode.climate = {'Dsa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 23];

%% set data
% zero-variate data

data.ab = 42;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 2*365;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '1-4 yr';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'ADW';
  temp.tpm = C2K(10);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.1;   units.Lb  = 'cm';  label.Lb  = 'total length at birth of tadpoles';  bibkey.Lb  = 'ADW';
data.Lj  = 2.2;   units.Lj  = 'cm';  label.Lj  = 'SVL for females at metam';   bibkey.Lj  = 'ADW';
  comment.Lj = 'based on lower boundary of size-range';
data.Li  = 5.4;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'DaugShel1982';
data.Lim  = 5.3; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'DaugShel1982';

data.Wwb = 0.0477; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'digitalatlas';
  comment.Wwb = 'based on egg diameter of 4-5mm: pi/6*0.45^3';
data.Wwi = 11.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Alytes obstetricans of 5 cm, 9 g: (5.4/5)^3*9';
data.Wwim = 10.7;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Alytes obstetricans of 5 cm, 9 g: (5.3/5)^3*9';

data.Ri  = 62/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge','ADW'};   
temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'amphibiabase: 44-75 eggs per clutch, 1 clutch per 2 yr'; 

% uni-variate data
% length-length
data.LL_f = [ ... % SVL (cm), SVL next yr (cm)
2.814	1.510
3.407	0.692
3.597	1.014
3.604	0.611
3.705	0.605
4.302	0.298
4.397	0.405
4.402	0.690
4.403	0.303
4.514	0.598
4.600	0.340
4.600	0.297
4.605	0.496
4.606	0.093
4.696	0.109
4.701	0.238
4.707	0.195
4.711	0.399
4.799	-0.321
4.807	0.297
4.808	0.093
4.812	0.399
4.898	0.194
4.899	0.098
4.903	0.297
4.995	0.017
4.999	0.194
5.000	0.114
5.000	0.065
5.003	0.598
5.004	0.329
5.004	0.296
5.005	0.081
5.037	0.130
5.042	0.087
5.095	0.194
5.101	-0.075
5.101	-0.107
5.106	0.092
5.106	0.017
5.133	-0.096
5.202	0.043
5.202	0.017
5.202	-0.107
5.207	0.135
5.207	0.108
5.213	-0.204
5.239	0.043
5.250	0.011
5.287	-0.070
5.293	-0.107
5.294	-0.279
5.298	0.086
5.303	0.140
5.303	0.054
5.303	0.022
5.304	-0.306
5.309	-0.215
5.330	-0.102
5.416	-0.210];	
units.LL_f   = {'d', 'cm'};  label.LL_f = {'SVL', 'SVL next yr'};  
temp.LL_f    = C2K(10); units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'DaugShel1982'; 
comment.LL_f = 'Data for females';
%
data.LL_m = [ ... % SVL (cm), SVL next yr (cm)
3.111	0.990
3.217	0.990
3.319	0.984
3.600	0.984
3.708	0.748
3.708	0.711
3.714	0.506
3.814	0.795
4.001	0.627
4.001	0.590
4.305	0.395
4.406	0.379
4.417	0.290
4.491	0.322
4.496	0.395
4.497	0.227
4.497	0.196
4.497	0.101
4.513	0.280
4.597	0.348
4.598	0.311
4.598	0.290
4.598	0.206
4.602	0.426
4.603	0.405
4.604	0.133
4.604	0.122
4.613	0.494
4.620	0.043
4.645	0.332
4.646	0.290
4.694	0.048
4.694	0.007
4.699	0.274
4.704	0.195
4.705	0.122
4.705	-0.077
4.705	-0.088
4.706	-0.203
4.710	0.222
4.715	0.316
4.721	0.111
4.731	0.227
4.736	0.185
4.741	0.279
4.742	0.022
4.743	-0.093
4.747	0.122
4.747	0.111
4.796	-0.083
4.800	0.326
4.800	0.290
4.805	0.221
4.805	0.185
4.806	0.143
4.806	0.127
4.811	0.080
4.811	0.033
4.811	-0.009
4.826	0.379
4.832	0.127
4.837	0.289
4.837	0.195
4.838	0.080
4.842	0.321
4.849	0.038
4.849	0.006
4.849	-0.025
4.896	0.132
4.901	0.106
4.902	-0.078
4.902	-0.114
4.902	-0.146
4.902	-0.156
4.907	0.190
4.908	-0.303
4.912	0.274
4.912	0.011
4.913	-0.209
4.918	0.048
4.928	0.132
4.929	-0.156
4.939	0.106
4.939	0.048
4.939	0.011
4.940	-0.214
5.003	-0.088
5.004	-0.172
5.004	-0.193
5.009	-0.288
5.013	0.121
5.013	0.100
5.015	-0.277
5.024	0.016
5.104	-0.131
5.108	0.378
5.109	0.095
5.109	0.043
5.110	-0.057
5.110	-0.319
5.115	0.006
5.130	0.048
5.141	0.011
5.216	-0.005
5.216	-0.188
5.311	0.005];	
units.LL_m   = {'d', 'cm'};  label.LL_m = {'SVL', 'SVL next yr'};  
temp.LL_m    = C2K(10); units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'DaugShel1982'; 
comment.LL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 3 * weights.LL_f;
weights.LL_m = 3 * weights.LL_m;
% weights.Wwi = 0 * weights.Wwi;
weights.tj = 0 * weights.tj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.p_M = 5 * weights.psd.p_M;
% weights.psd.kap = 3 * weights.psd.kap;
% weights.psd.v   = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Tadpoles are growing faster than toads';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'amphibiaweb states that tadpoles grow from 1.8 to 7.6 cm in a few weeks, but most tadpoles do overwinter (pers. com. Samuel Pinya Fernandez)';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'These are the only North American frog species that reproduce by internal fertilization; tail of male is part of cloaca';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Lacking the ability to vocalise, and in possessing free rib';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'H5CV'; % Cat of Life
metaData.links.id_ITIS = '173546'; % ITIS
metaData.links.id_EoL = '330950'; % Ency of Life
metaData.links.id_Wiki = 'Ascaphus_truei'; % Wikipedia
metaData.links.id_ADW = 'Ascaphus_truei'; % ADW
metaData.links.id_Taxo = '47576'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ascaphus+truei'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ascaphus_truei'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ascaphus_truei}}';
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
bibkey = 'DaugShel1982'; type = 'Article'; bib = [ ... 
'author = {Charles H. Daugherty and Andrew L. Sheldon}, ' ... 
'year = {1982}, ' ...
'title = {Age-Determination, Growth, and Life History of a {M}ontana Population of the Tailed Frog (\emph{Ascaphus truei})}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {38(4)}, ' ...
'pages = {461-468}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ascaphus_truei/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ascaphus+truei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ascaphus_truei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'digitalatlas'; type = 'Misc'; bib = ...
'howpublished = {\url{https://digitalatlas.cose.isu.edu/bio/amph/anurans/astr/astrfram.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
