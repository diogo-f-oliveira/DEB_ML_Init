function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_orientalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_orientalis'; 
metaData.species_en = 'Pacific bluefin tuna'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'T-ab'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Marko Jusup'};    
metaData.date_subm = [2011 04 25];              
metaData.email    = {'mjusup@gmail.com'};            
metaData.address  = {'Kyoto University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2012 02 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];


%% set data
% zero-variate data

data.ap = 1170;   units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'JusuKlan2011';
  temp.ap = C2K(25.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'JusuKlan2011';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.308; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'JusuKlan2011';  
data.Lp  = 150;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'JusuKlan2011'; 
data.Li  = 265;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'JusuKlan2011';
 
% uni-variate data

% temperature - age at birth
data.Tab = [ ... % temp (K), a_b (d)
  293.0500    1.7150
  293.1500    1.8608
  294.3500    1.4896
  296.8500    1.3333
  297.5500    1.2358
  299.3500    1.0171
  300.0500    1.1004
  301.1500    1.0067
  301.9500    0.9929
  302.9500    0.9442
  304.6500    0.8192
  306.5500    0.8400];
units.Tab   = {'K', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'JusuKlan2011';

% t-L data
% larva
data.tL_lrv = [ ... time since birth (d), length (cm)
    0.0831    0.3439
    1.0803    0.3635
    2.0776    0.3635
    3.0748    0.3832
    4.0720    0.4127
    5.0693    0.4520
    6.0665    0.4716
    7.0222    0.5109
    8.0609    0.5207
    9.0582    0.5502
   10.0554    0.5895
   11.0526    0.6288
   12.0083    0.7467
   13.0055    0.8548
   14.0443    0.9727
   15.0831    1.0710
   16.0388    1.1790
   17.0360    1.2969
   17.9917    1.4148
   19.0720    1.5917
   20.0277    1.8373
   21.0249    1.8865
   22.0637    2.1714
   23.0194    2.3876
   24.0166    2.6332
   25.0554    2.8297
   25.9695    3.1343
   26.9252    3.4782
   27.9640    3.5273
   28.9612    3.9891];
units.tL_lrv   = {'d', 'cm'};  label.tL_lrv = {'time since birth', 'total length'};  
temp.tL_lrv    = C2K(25.5);  units.temp.tL_lrv = 'K'; label.temp.tL_lrv = 'temperature';
bibkey.tL_lrv = 'JusuKlan2011';
% juvenile
data.tL_juv = [ ... % time since birth (d), length (cm)
   29.2017    3.6563
   34.1087    5.0446
   38.6683    6.7911
   44.0510    9.5711
   49.0822   12.1127
   53.9976   14.7737
   59.0286   17.2756
   64.0594   19.7377
   68.9722   22.0010
   74.0021   24.3437
   79.0313   26.5672
   84.0599   28.7111
   88.9688   30.3778
   93.9909   31.5274
   99.0130   32.6770
  104.0341   33.6676
  109.0544   34.5388
  114.0742   35.3305];
units.tL_juv   = {'d', 'cm'};  label.tL_juv = {'time since birth', 'total length'};  
temp.tL_juv    = C2K(25.5);  units.temp.tL_juv = 'K'; label.temp.tL_juv = 'temperature';
bibkey.tL_juv = 'JusuKlan2011';
% adult
data.tL_adt = 1e3 * [ ... % time since birth (d), length (cm)
    0.1821    0.0528 
    0.3645    0.0779
    0.5470    0.1010
    0.7294    0.1187
    0.9118    0.1338
    1.0943    0.1473
    1.2790    0.1618
    1.4615    0.1745
    1.6439    0.1851
    1.8252    0.1952
    2.0088    0.2029
    2.1935    0.2087
    2.3736    0.2161
    2.5584    0.2225
    2.7408    0.2272
    2.9210    0.2320
    3.1057    0.2360
    3.2858    0.2394
    3.4706    0.2420
    3.6530    0.2452
    3.8331    0.2468
    4.0179    0.2481
    4.2003    0.2516
    4.3828    0.2537];
units.tL_adt   = {'d', 'cm'};  label.tL_adt = {'time since birth', 'total length'};  
temp.tL_adt    = C2K(25.5);  units.temp.tL_adt = 'K'; label.temp.tL_adt = 'temperature';
bibkey.tL_adt = 'JusuKlan2011';

% L-W data
% juvenile
data.LW_juv = [ ... % length (cm), wet weight (kg)
   10.0180    0.0131
   10.9921    0.0166
   12.0010    0.0216
   13.0099    0.0279
   14.0189    0.0350
   14.9932    0.0421
   16.0024    0.0534
   17.0116    0.0654
   17.9861    0.0803
   18.9955    0.0966
   20.0051    0.1157
   21.0147    0.1370
   21.9894    0.1561
   22.9995    0.1880
   24.0093    0.2142
   24.9846    0.2447
   25.9949    0.2823
   27.0054    0.3227
   28.0158    0.3632
   28.9916    0.4050
   30.0023    0.4525
   31.0133    0.5050
   32.0245    0.5639
   33.0011    0.6235
   33.9078    0.6788
   34.9893    0.7526];
data.LW_juv(:,2) = data.LW_juv(:,2) * 1e3; % convert kg to g
units.LW_juv = {'cm', 'g'};     label.LW_juv = {'total length', 'wet weight'};  
bibkey.LW_juv = 'JusuKlan2011';
% adult
data.LW_adt = [ ... % length (cm), wet weight (kg)
   50.0000    2.4051
   58.5417    3.9527
   67.0833    6.0704
   75.6250    8.8548
   84.1667   12.4044
   92.7083   16.8193
  101.2500   22.2013
  109.7917   28.6535
  118.3333   36.2803
  126.8750   45.1875
  135.4167   55.4819
  143.9583   67.2713
  152.5000   80.6647
  161.0417   95.7722
  169.5833  112.7044
  178.1250  131.5731
  186.6667  152.4910
  195.2083  175.5713
  203.7500  200.9284
  212.2917  228.6770
  220.8333  258.9330
  229.3750  291.8125
  237.9167  327.4327
  246.4583  365.9113
  255.0000  407.3665]; 
data.LW_adt(:,2) = data.LW_adt(:,2) * 1e3; % convert kg to g
units.LW_adt = {'cm', 'g'}; label.LW_adt = {'total length', 'wet weight'};  
bibkey.LW_adt = 'JusuKlan2011';

% L-N data
data.LN = [ ... % length (cm), eggs (1e6)
  194.0098    5.7969
  195.9779   15.5712
  196.8635    7.3202
  196.9619   12.1016
  200.8979   13.5825
  201.0947   11.2553
  201.9803   13.5402
  202.0787   10.6629
  203.9483   16.2059
  205.0307   18.9986
  210.0492   13.9210
  210.1476   18.2793
  213.0996   22.2567
  216.0517   14.3441
  216.0517   17.6446
  216.0517   20.0987
  217.9213   20.2680
  219.8893   18.2793
  228.0566   25.3032
  241.0455   21.4104];
units.LN   = {'cm', '1e6 eggs'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(25.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JusuKlan2011';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'This version is re-worked relative to JusuKlan2001 to fit the standard DEB model';
D2 = 'birth is assumed to occur at hatch';
D3 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '56P7D'; % Cat of Life
metaData.links.id_ITIS = '172422'; % ITIS
metaData.links.id_EoL = '46577340'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_orientalis'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_orientalis'; % ADW
metaData.links.id_Taxo = '189037'; % Taxonomicon
metaData.links.id_WoRMS = '273823'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-orientalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_orientalis}}';
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
bibkey = 'JusuKlan2011'; type = 'Article'; bib = [ ... 
'author = {M. Jusup and T. Klanjscek and H. Matsuda and S. A. L. M. Kooijman.}, ' ... 
'year = {2011}, ' ...
'title = {A full lifecycle bioenergetic model for bluefin tuna}, ' ...
'journal = {Plos Biology}, ' ...
'volume = {6}, ' ...
'pages = {e21903}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

