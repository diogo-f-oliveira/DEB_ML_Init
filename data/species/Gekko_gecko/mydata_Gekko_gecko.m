function [data, auxData, metaData, txtData, weights] = mydata_Gekko_gecko
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Gekkonidae';
metaData.species    = 'Gekko_gecko'; 
metaData.species_en = 'Tokay gecko'; 

metaData.ecoCode.climate = {'Am','Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 09];

%% set data
% zero-variate data

data.am = 23.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 4.8;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'FauzHami2022';  
data.Lp  = 17.3;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Gekko_hokouensis: 4.3*20.9/5.2';
data.Li  = 20.9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Wiki';
  comment.Li = 'TL 40 cm, converted to SVL using F1';

data.Wwb = 2.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'FauzHami2022';
data.Wwi = 150.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'AnAge';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(27);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, upto 1 clutch each 1  mnth';

% univariate data
% time-length 
data.tL_f = [ ... % time (yr), SVL (cm)
0.426	4.658
8.091	4.770
14.905	4.882
22.357	4.963
28.958	5.012
36.624	5.172
42.586	5.347
49.612	5.443
56.852	5.540
63.665	5.636
70.905	5.717
77.719	5.781
84.745	5.862
91.772	6.006
98.798	5.991
105.825	6.262
112.852	6.548
119.240	6.645
126.692	6.757
133.506	6.838
140.532	6.934
147.559	7.078
154.586	7.142
161.825	7.318
168.639	7.351];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FauzHami2022';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time (yr), SVL (cm)
0.852	4.896
7.878	5.055
14.905	5.088
21.932	5.153
28.958	5.170
36.198	5.346
43.011	5.474
49.825	5.523
57.065	5.572
63.878	5.668
70.905	5.638
77.293	5.734
84.745	5.799
91.559	6.022
98.586	6.229
106.038	6.246
112.852	6.374
119.878	6.486
126.266	6.567
133.719	6.711
140.532	6.760
147.772	6.793
154.586	6.873
162.038	7.049
168.639	7.082];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FauzHami2022';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time (yr), SVL (cm)
0.924	2.374
7.948	2.278
15.396	2.141
22.633	2.060
28.594	2.005
36.064	2.586
42.892	3.071
49.915	2.948
56.732	3.059
63.549	3.171
70.373	3.489
77.824	3.463
84.846	3.312
91.889	3.838
98.716	4.267
106.155	3.841
112.780	4.615
119.600	4.837
126.422	5.114
134.097	5.433
140.687	5.061
147.724	5.408
155.180	5.533
161.579	5.893
168.830	6.281];
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(27);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'FauzHami2022';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time (yr), SVL (cm)
0.925	2.387
7.951	2.389
15.400	2.252
21.786	2.184
28.808	2.061
35.858	2.807
42.257	3.181
49.483	2.754
57.150	2.797
63.543	2.950
70.786	3.089
77.600	3.090
84.831	2.788
92.092	3.521
98.488	3.784
105.924	3.233
112.967	3.773
119.788	4.022
126.607	4.175
133.433	4.604
140.446	4.150
147.698	4.565
154.940	4.636
161.762	4.927
168.594	5.508];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(27);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'FauzHami2022';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to not differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'based on photo: SVL = TL * 0.522';
metaData.bibkey.F1 = 'Wiki_Fr'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FH5H'; % Cat of Life
metaData.links.id_ITIS = '174050'; % ITIS
metaData.links.id_EoL = '794412'; % Ency of Life
metaData.links.id_Wiki = 'Gekko_gecko'; % Wikipedia
metaData.links.id_ADW = 'Gekko_gecko'; % ADW
metaData.links.id_Taxo = '48873'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gekko&species=gecko'; % ReptileDB
metaData.links.id_AnAge = 'Gekko_gecko'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gekko_gecko}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_Fr'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fr.wikipedia.org/wiki/Gekko_gecko}}';
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
bibkey = 'FauzHami2022'; type = 'Article'; bib = [ ... 
'doi = {10.47349/jbi/18022022/177}, ' ...
'author = {Muhammad Alif Fauzi and Amir Hamidy}, ' ... 
'year = {2022}, ' ...
'title = {First Report of Growth Rate Juvenile {T}okay Gecko (\emph{Gekko gecko} {L}innaeus, 1758) during Twenty-four Weeks in Captive Breeding Facility}, ' ...
'pages = {177-181}, ' ...
'volume = {18(2)}, ' ...
'journal = {Jurnal Biologi Indonesia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gekko_gecko}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794412/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Gekko_gecko/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
    